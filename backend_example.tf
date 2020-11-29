# terraform {
#   backend "remote" {
#     organization = "saa-udc"

#     workspaces {
#       name = "<ENTER YOUR TERRAFORM WORKSPACE NAME>"
#     }
#   }
# }
# If you choose to use terraform workspaces please either set the workspace to use local cli driven calls
# Or you can configure the workspace with environment variables, keys, secrets etc
# You can also try using s3 or just leaving this config commented and it will default to local statefiles