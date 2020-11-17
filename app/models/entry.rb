class Entry < ApplicationRecord
  after_destroy :destroy_empty_room
  belongs_to :user
  belongs_to :room
  
  private
    
    def destroy_empty_room
      room.destroy if room.reload.entries.empty?
    end
end
