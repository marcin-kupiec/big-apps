data "aws_vpc" "this" {
  id = var.vpc_id
}

data "aws_subnet_ids" "public" {
  vpc_id = var.vpc_id

  tags = {
    Tier = "Public"
  }
}

data "aws_subnet_ids" "private" {
  vpc_id = var.vpc_id

  tags = {
    Tier = "Private"
  }
}

resource "aws_key_pair" "access_key" {
  key_name   = "access_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC/WYddT3RNaVZKeOm4/Gt0bnmjnKpi5FXaKDbn/R4xpJMoP5/zjKxxyws2GS5Pi6vs7G/6ZXBeoF+qGwz1PLPuCPQmly3ipeWWNECVUAlgWLF0nyWmtMvZPqhjJ2Rw7yLUnOZr6Z4c8QvQx9vuv4UQnWKDjdkikSii7BWxc0AzEkNBO69SQqpWUM6jKObrRws+dXJAKSke+QizH11GbDclh6dG7p1TOd9f2xMMU/S8vhjDf/WPezj7D/bnIFgHP5AtUkPRg0MDgymrjHGwJkkIU7Ut6407TsPxr1fBwxLiSw+oTIUKIhYgrq+MayWVRWq/C1nz8LWz4U9rscgaM++5p3YXfLe1BpzqVp4D+z9Amt78NRUit1SwyedqvJEOzdpvOtyFmqmCa2j/7Q/92hSfiZ19ZJDAodTY95xuvON96zYkeEHfWrxniEJAErBSmelqp4AXzxVODMHshsGV8YdWzsnff7R0l2PGp33GTx7mJJEo0Xm4+zjswZugIlT/4FOhd4K1fLlxHVwOzTRp4xhOun201ym1obxXbgvWzq6QzbSMoSWwILwC3i9D4hXye4okRcWmZxSypw5igcBJv823fGXeQHH5UGo71yGtGfeiLp5BsFgvOMp7XezOJIl4UgKfo8XeNADmsZRBLqlVECQDaUKJr2qTGcf69Ecd332Jnw== marcin.kupiec@brainly.com"
}
