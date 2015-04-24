require 'chef/provider/lwrp_base'

class Chef
  class Provider
    class MysqlClient
      class Ubuntu < Chef::Provider::MysqlClient
        def packages
          case node['platform_version']
          when '10.04', '11.04', '11.10'
            packages = %w(mysql-client-5.1 libmysqlclient-dev)
          else
            # This results in us getting v5.5 even on Ubuntu >= 14, where v5.6
            # is available (in addition to v5.5). If that's a problem,
            # you should upgrade to v6.x of this cookbook.
            packages = %w(mysql-client-5.5 libmysqlclient-dev)
          end
          packages
        end
      end
    end
  end
end
