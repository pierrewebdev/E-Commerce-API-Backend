class CustomerSerializer < ActiveModel::Serializer
  attributes :id,:name,:address,:email
end
