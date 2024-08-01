resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "sub-develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

resource "yandex_vpc_subnet" "sub-develop2" {
  name           = var.vpc_name2
  zone           = var.default_zone2
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr2
}

resource "yandex_vpc_gateway" "egress-gateway" {
  name = "egress-gateway"
  shared_egress_gateway {}
}

resource "yandex_vpc_route_table" "that" {
  network_id = yandex_vpc_network.develop.id

  #   static_route {
  #     destination_prefix = "10.0.2.0/24"
  #     next_hop_address   = "10.0.2.16"
  #   }

  #   static_route {
  #     destination_prefix = "10.0.1.0/24"
  #     next_hop_address   = "10.0.1.6"
  #   }


  static_route {
    destination_prefix = "0.0.0.0/0"
    gateway_id         = yandex_vpc_gateway.egress-gateway.id
  }
}