resource "aws_key_pair" "saiful-key-pair" {
    key_name = "saiful-key-pair"
    public_key = "${file(var.PUBLIC_KEY_PATH)}"
}
