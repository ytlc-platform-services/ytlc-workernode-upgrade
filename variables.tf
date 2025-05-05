variable "subnet_id" {
  description = "The ID of the subnet where the worker node will be launched."
  type        = string
}

variable "dedicated_host_id" {
  description = "The ID of the dedicated host for the worker node."
  type        = string
}

variable "worker_count" {
  description = "The number of worker nodes to launch."
  type        = number
  default     = 1
}

variable "key_name" {
  description = "The name of the EC2 key pair to use for the worker node."
  type        = string
}

variable "worker_security_group_id" {
  description = "The security group ID for the worker node."
  type        = string
}

variable "volume_size" {
  description = "The size of the root volume for the worker node."
  type        = number
  default     = 20
}

variable "tags" {
  description = "A map of tags to assign to the worker node."
  type        = map(string)
  default     = {}
}

variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
}

variable "cluster_ca" {
  description = "The base64-encoded certificate authority data for the EKS cluster."
  type        = string
}

variable "api_server_url" {
  description = "The API server endpoint URL for the EKS cluster."
  type        = string
}