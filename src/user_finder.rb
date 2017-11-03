class UserFinder
  def self.user_from_id(client, id)
    client.store.users.detect { |user_id, user| user_id == id }[1]
  end

  def self.username_from_id(client, id)
    user_from_id(client, id)["name"]
  end
end
