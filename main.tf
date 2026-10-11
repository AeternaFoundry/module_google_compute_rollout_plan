resource "google_compute_rollout_plan" "compute_rollout_plans" {
  for_each = var.compute_rollout_plans

  name            = each.value.name
  deletion_policy = each.value.deletion_policy
  description     = each.value.description
  location_scope  = each.value.location_scope
  project         = each.value.project

  dynamic "waves" {
    for_each = each.value.waves
    content {
      display_name = waves.value.display_name
      dynamic "orchestration_options" {
        for_each = waves.value.orchestration_options != null ? [waves.value.orchestration_options] : []
        content {
          dynamic "delays" {
            for_each = orchestration_options.value.delays != null ? orchestration_options.value.delays : []
            content {
              delimiter = delays.value.delimiter
              duration  = delays.value.duration
              type      = delays.value.type
            }
          }
          max_concurrent_locations              = orchestration_options.value.max_concurrent_locations
          max_concurrent_resources_per_location = orchestration_options.value.max_concurrent_resources_per_location
        }
      }
      dynamic "selectors" {
        for_each = waves.value.selectors
        content {
          dynamic "location_selector" {
            for_each = selectors.value.location_selector != null ? [selectors.value.location_selector] : []
            content {
              included_locations = location_selector.value.included_locations
            }
          }
          dynamic "resource_hierarchy_selector" {
            for_each = selectors.value.resource_hierarchy_selector != null ? [selectors.value.resource_hierarchy_selector] : []
            content {
              included_folders       = resource_hierarchy_selector.value.included_folders
              included_organizations = resource_hierarchy_selector.value.included_organizations
              included_projects      = resource_hierarchy_selector.value.included_projects
            }
          }
        }
      }
      validation {
        dynamic "time_based_validation_metadata" {
          for_each = waves.value.validation.time_based_validation_metadata != null ? [waves.value.validation.time_based_validation_metadata] : []
          content {
            wait_duration = time_based_validation_metadata.value.wait_duration
          }
        }
        type = waves.value.validation.type
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
    }
  }
}

