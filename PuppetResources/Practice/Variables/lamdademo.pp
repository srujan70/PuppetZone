each($facts['partitions']) | $key, $value | {
  notify {
    "${key} =  ${value['size']}" :
  }
}
