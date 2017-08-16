# This define type manage all entrys of hosts file

define ansible::hosts (
  Array $entrys
) {

  concat::fragment { $title:
    target  => "${ansible::confdir}/hosts",
    content => epp('ansible/hosts.epp',
      {
        section => $title,
        entrys  => $entrys,
      }),
  }

}