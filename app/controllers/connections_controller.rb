class ConnectionsController < ApplicationController
  def list
    @connections = Connection.all

    render("connection_templates/list.html.erb")
  end

  def details
    @connection = Connection.where({ :id => params.fetch("id_to_display") }).first

    render("connection_templates/details.html.erb")
  end

  def blank_form
    @connection = Connection.new

    render("connection_templates/blank_form.html.erb")
  end

  def save_new_info
    @connection = Connection.new

    @connection.company_id = params.fetch("company_id")
    @connection.location_id = params.fetch("location_id")
    @connection.photo = params.fetch("photo")
    @connection.name = params.fetch("name")
    @connection.linkein = params.fetch("linkein")

    if @connection.valid?
      @connection.save

      redirect_to("/connections", { :notice => "Connection created successfully." })
    else
      render("connection_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @connection = Connection.where({ :id => params.fetch("id_to_prefill") }).first

    render("connection_templates/prefilled_form.html.erb")
  end

  def save_edits
    @connection = Connection.where({ :id => params.fetch("id_to_modify") }).first

    @connection.company_id = params.fetch("company_id")
    @connection.location_id = params.fetch("location_id")
    @connection.photo = params.fetch("photo")
    @connection.name = params.fetch("name")
    @connection.linkein = params.fetch("linkein")

    if @connection.valid?
      @connection.save

      redirect_to("/connections/" + @connection.id.to_s, { :notice => "Connection updated successfully." })
    else
      render("connection_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @connection = Connection.where({ :id => params.fetch("id_to_remove") }).first

    @connection.destroy

    redirect_to("/connections", { :notice => "Connection deleted successfully." })
  end
end
