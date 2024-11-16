/**
 * Copyright 2024 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

module "git_repo_connection" {
  source  = "terraform-google-modules/bootstrap/google//modules/cloudbuild_repo_connection"
  version = "~> 8.0"

  project_id = var.project_id
  connection_config = {
    connection_type         = "GITHUBv2"
    github_secret_id        = var.github_pat_secret_id
    github_app_id_secret_id = var.github_app_id_secret_id
  }

  cloud_build_repositories = {
    "test_repo" = {
      repository_name = var.repository_name
      repository_url  = var.repository_url
    },
  }
}
