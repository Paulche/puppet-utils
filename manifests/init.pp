
class utils {

  exec { 'utils.puppet.kill':
    command     => '/usr/bin/killall -9 puppet',
    refreshonly => true,
  }

}
