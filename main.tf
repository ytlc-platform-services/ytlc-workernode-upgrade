
# find the latest Amazon EKS Worker Node AMI ami_id


resource "aws_instance" eks_worker_node {
    ami             = "ami-0180d9f82588d5224"
    instance_type   = var.instance_type
    subnet_id       = var.subnet_id
    host_id         = var.dedicated_host_id
    count           = var.worker_count
    key_name        = var.key_name # Reuse old EC2 keypair
    vpc_security_group_ids  = [var.worker_security_group_id]
    root_block_device {
        volume_type     = "gp3"
        volume_size     = var.volume_size
        tags = merge(
            var.tags,
            {
                Name = "${var.cluster_name}-worker-${count.index}"
            } 
        )
    }

    # Use user_data to bootstrap new worker-node to new EKS cluster
    user_data       = <<EOF
    #!/bin/bash
    set -o xtrace

    B64_CLUSTER_CA="${var.cluster_ca}"
    API_SERVER_URL="${var.api_server_url}"

    /etc/eks/bootstrap.sh "${var.cluster_name}"
    EOF

}
