variable "name" {
    type = string
}

variable "description" {
    type = string
    default = null
}

variable "privacy" {
    type = string
}

variable "ldap_dn" {
    type = string
    default = null
}

variable "parent_team_id" {
    type = string
    default = null
}

variable "create_default_maintainer" {
    type = string
    default = true
}

variable "members" {
    type = map
}

variable "repositories" {
    type = map
}

