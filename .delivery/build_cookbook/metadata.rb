name 'build_cookbook'
maintainer 'Zack Zlotnik'
maintainer_email 'zackzlotnik@gmail.com'
license 'all_rights'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)

depends 'delivery-truck'
