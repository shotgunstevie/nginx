user node["nginx"]["deploy_user"] do
  password "password"
  action :create
end
group node["nginx"]["deploy_group"] do
  action :create
end
