resource "aws_ecr_repository" "ecr_digg" {
  for_each             = var.targets
  name                 = format("argoXkustomize-%s", each.value.Name)
  image_tag_mutability = "IMMUTABLE"

}

resource "aws_ecr_lifecycle_policy" "life_policy" {
  for_each   = aws_ecr_repository.ecr_digg
  repository = each.value.name
  policy     = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Image expiration rule",
            "selection": {
                "tagStatus": "any",
                "countType": "sinceImagePushed",
                "countUnit": "days",
                "countNumber": 2
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}
