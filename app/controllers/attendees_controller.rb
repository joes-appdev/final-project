class AttendeesController < ApplicationController
  def list
    @attendees = Attendee.all

    render("attendee_templates/list.html.erb")
  end

  def details
    @attendee = Attendee.where({ :id => params.fetch("id_to_display") }).first

    render("attendee_templates/details.html.erb")
  end

  def blank_form
    @attendee = Attendee.new

    render("attendee_templates/blank_form.html.erb")
  end

  def save_new_info
    @attendee = Attendee.new

    @attendee.meeting_id = params.fetch("meeting_id")
    @attendee.connection_id = params.fetch("connection_id")

    if @attendee.valid?
      @attendee.save

      redirect_to("/attendees", { :notice => "Attendee created successfully." })
    else
      render("attendee_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @attendee = Attendee.where({ :id => params.fetch("id_to_prefill") }).first

    render("attendee_templates/prefilled_form.html.erb")
  end

  def save_edits
    @attendee = Attendee.where({ :id => params.fetch("id_to_modify") }).first

    @attendee.meeting_id = params.fetch("meeting_id")
    @attendee.connection_id = params.fetch("connection_id")

    if @attendee.valid?
      @attendee.save

      redirect_to("/attendees/" + @attendee.id.to_s, { :notice => "Attendee updated successfully." })
    else
      render("attendee_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @attendee = Attendee.where({ :id => params.fetch("id_to_remove") }).first

    @attendee.destroy

    redirect_to("/attendees", { :notice => "Attendee deleted successfully." })
  end
end
