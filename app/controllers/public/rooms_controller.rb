class Public::RoomsController < ApplicationController
  before_action :authenticate_user!
  def create
    # room = Room.create
    # current_entry = Entry.create(user_id: current_user.id, room_id: room.id)
    # another_entry = Entry.create(user_id: params[:entry][:user_id], room_id: room.id)
    # redirect_to room_path(room)
  end

  def index
  end

  def show
  end
end
