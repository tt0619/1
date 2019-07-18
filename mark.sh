#!/bin/bash
ip rule add from $(ip route get 1 | grep -Po '(?<=src )(\S+)') table 3
ip route add table 3 to $(ip route get 1 | grep -Po '(?<=src )(\S+)')/32 dev $(ip -4 route ls | grep default | grep -Po '(?<=dev )(\S+)')
ip route add table 3 default via $(ip -4 route ls | grep default | grep -Po '(?<=via )(\S+)')
