class TherapistsController < ApplicationController
  def index
    @therapists = Therapist.all

    @markers = @therapists.geocoded.map do |therapist|
      {
        lat: therapist.latitude,
        lng: therapist.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {therapist: therapist}),

        marker_html: render_to_string(partial: "marker", locals: {therapist: therapist})

      }
    end
  end
  def chatroom
    therapist = Therapist.find(params[:id])
    chatroom = therapist.chatroom

    unless chatroom
      chatroom = Chatroom.create(therapist: therapist)



    end
end

end
