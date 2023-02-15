variable "bucket" {
    description = "The name of the bucket. If omitted, Terraform will assign a random, unique name."
    type        = string
}

variable "tags" {
    description = "A mapping of tags that identify the bucket."
    type        = map(string)
    default     = {}
}

variable "force_destroy" {
    description = "A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable."
    type        = bool
    default     = false  
}

variable "policy" {
    description = "The bucket policy as a JSON document."
    type        = string
    default     = ""
}

variable "object_list" {
    description = "A list of objects to be created in the bucket."
    type        = list(object({
        key    = string
        source = string
    }))
    default     = []
}