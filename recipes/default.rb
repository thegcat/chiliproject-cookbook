self.class.send(:include, ChiliProject::Helpers)

# First create the required databases if configured
include_recipe "chiliproject::database"

# Then deploy the ChiliProject instances
instances = Chef::DataBag.load("chiliproject")
instances.each_pair do |name, inst|
  chiliproject instance['id'] do
    instance inst
  end
end
