class JobSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :slug, :title, :company, :link
end
