variable "compute_rollout_plans" {
  description = <<EOT
Map of compute_rollout_plans, attributes below
Required:
    - name
    - waves (block):
        - display_name (optional)
        - orchestration_options (optional, block):
            - delays (optional, block):
                - delimiter (optional)
                - duration (optional)
                - type (optional)
            - max_concurrent_locations (optional)
            - max_concurrent_resources_per_location (optional)
        - selectors (required, block):
            - location_selector (optional, block):
                - included_locations (optional)
            - resource_hierarchy_selector (optional, block):
                - included_folders (optional)
                - included_organizations (optional)
                - included_projects (optional)
        - validation (required, block):
            - time_based_validation_metadata (optional, block):
                - wait_duration (optional)
            - type (required)
Optional:
    - deletion_policy
    - description
    - location_scope
    - project
    - timeouts (block):
        - create (optional)
        - delete (optional)
EOT

  type = map(object({
    name            = string
    deletion_policy = optional(string)
    description     = optional(string)
    location_scope  = optional(string)
    project         = optional(string)
    waves = list(object({
      display_name = optional(string)
      orchestration_options = optional(object({
        delays = optional(list(object({
          delimiter = optional(string)
          duration  = optional(string)
          type      = optional(string)
        })))
        max_concurrent_locations              = optional(number)
        max_concurrent_resources_per_location = optional(number)
      }))
      selectors = list(object({
        location_selector = optional(object({
          included_locations = optional(list(string))
        }))
        resource_hierarchy_selector = optional(object({
          included_folders       = optional(list(string))
          included_organizations = optional(list(string))
          included_projects      = optional(list(string))
        }))
      }))
      validation = object({
        time_based_validation_metadata = optional(object({
          wait_duration = optional(string)
        }))
        type = string
      })
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.compute_rollout_plans : (
        length(v.waves) >= 1
      )
    ])
    error_message = "Each waves list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.compute_rollout_plans : (
        alltrue([for item in v.waves : (length(item.selectors) >= 1)])
      )
    ])
    error_message = "Each selectors list must contain at least 1 items"
  }
  # Note: 3 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

