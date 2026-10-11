output "compute_rollout_plans_id" {
  description = "Map of id values across all compute_rollout_plans, keyed the same as var.compute_rollout_plans except keys with no id are omitted"
  value       = { for k, v in google_compute_rollout_plan.compute_rollout_plans : k => v.id if v.id != null && length(v.id) > 0 }
}
output "compute_rollout_plans_deletion_policy" {
  description = "Map of deletion_policy values across all compute_rollout_plans, keyed the same as var.compute_rollout_plans except keys with no deletion_policy are omitted"
  value       = { for k, v in google_compute_rollout_plan.compute_rollout_plans : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "compute_rollout_plans_description" {
  description = "Map of description values across all compute_rollout_plans, keyed the same as var.compute_rollout_plans except keys with no description are omitted"
  value       = { for k, v in google_compute_rollout_plan.compute_rollout_plans : k => v.description if v.description != null && length(v.description) > 0 }
}
output "compute_rollout_plans_location_scope" {
  description = "Map of location_scope values across all compute_rollout_plans, keyed the same as var.compute_rollout_plans except keys with no location_scope are omitted"
  value       = { for k, v in google_compute_rollout_plan.compute_rollout_plans : k => v.location_scope if v.location_scope != null && length(v.location_scope) > 0 }
}
output "compute_rollout_plans_name" {
  description = "Map of name values across all compute_rollout_plans, keyed the same as var.compute_rollout_plans except keys with no name are omitted"
  value       = { for k, v in google_compute_rollout_plan.compute_rollout_plans : k => v.name if v.name != null && length(v.name) > 0 }
}
output "compute_rollout_plans_project" {
  description = "Map of project values across all compute_rollout_plans, keyed the same as var.compute_rollout_plans except keys with no project are omitted"
  value       = { for k, v in google_compute_rollout_plan.compute_rollout_plans : k => v.project if v.project != null && length(v.project) > 0 }
}
output "compute_rollout_plans_self_link" {
  description = "Map of self_link values across all compute_rollout_plans, keyed the same as var.compute_rollout_plans except keys with no self_link are omitted"
  value       = { for k, v in google_compute_rollout_plan.compute_rollout_plans : k => v.self_link if v.self_link != null && length(v.self_link) > 0 }
}
output "compute_rollout_plans_waves" {
  description = "Map of waves values across all compute_rollout_plans, keyed the same as var.compute_rollout_plans except keys with no waves are omitted"
  value       = { for k, v in google_compute_rollout_plan.compute_rollout_plans : k => v.waves if v.waves != null && length(v.waves) > 0 }
}

