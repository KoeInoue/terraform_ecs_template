resource "aws_ecr_repository" "app-image" {
  name                 = "docker_template_app"
  image_tag_mutability = "IMMUTABLE"
}

resource "aws_ecr_repository" "web-image" {
  name                 = "docker_template_web"
  image_tag_mutability = "IMMUTABLE"
}
