class MeetingsController < ApplicationController
  def list
    @meetings = Meeting.all

    render("meeting_templates/list.html.erb")
  end

  def details
    @meeting = Meeting.where({ :id => params.fetch("id_to_display") }).first

    render("meeting_templates/details.html.erb")
  end

  def blank_form
    @meeting = Meeting.new

    render("meeting_templates/blank_form.html.erb")
  end

  def save_new_info
    @meeting = Meeting.new

    @meeting.connections_id = params.fetch("connections_id")
    @meeting.date = params.fetch("date")
    @meeting.meeting_notes = params.fetch("meeting_notes")
    @meeting.location_id = params.fetch("location_id")
    @meeting.user_id = params.fetch("user_id")
    @meeting.meeting_type = params.fetch("meeting_type")

    if @meeting.valid?
      @meeting.save

      redirect_to("/meetings", { :notice => "Meeting created successfully." })
    else
      render("meeting_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @meeting = Meeting.where({ :id => params.fetch("id_to_prefill") }).first

    render("meeting_templates/prefilled_form.html.erb")
  end

  def save_edits
    @meeting = Meeting.where({ :id => params.fetch("id_to_modify") }).first

    @meeting.connections_id = params.fetch("connections_id")
    @meeting.date = params.fetch("date")
    @meeting.meeting_notes = params.fetch("meeting_notes")
    @meeting.location_id = params.fetch("location_id")
    @meeting.user_id = params.fetch("user_id")
    @meeting.meeting_type = params.fetch("meeting_type")

    if @meeting.valid?
      @meeting.save

      redirect_to("/meetings/" + @meeting.id.to_s, { :notice => "Meeting updated successfully." })
    else
      render("meeting_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @meeting = Meeting.where({ :id => params.fetch("id_to_remove") }).first

    @meeting.destroy

    redirect_to("/meetings", { :notice => "Meeting deleted successfully." })
  end
end
