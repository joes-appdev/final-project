class CompaniesController < ApplicationController
  def list
    @companies = Company.all

    render("company_templates/list.html.erb")
  end

  def details
    @company = Company.where({ :id => params.fetch("id_to_display") }).first

    render("company_templates/details.html.erb")
  end

  def blank_form
    @company = Company.new

    render("company_templates/blank_form.html.erb")
  end

  def save_new_info
    @company = Company.new

    @company.company = params.fetch("company")
    @company.location = params.fetch("location")

    if @company.valid?
      @company.save

      redirect_to("/companies", { :notice => "Company created successfully." })
    else
      render("company_templates/blank_form.html.erb")
    end
  end

  def prefilled_form
    @company = Company.where({ :id => params.fetch("id_to_prefill") }).first

    render("company_templates/prefilled_form.html.erb")
  end

  def save_edits
    @company = Company.where({ :id => params.fetch("id_to_modify") }).first

    @company.company = params.fetch("company")
    @company.location = params.fetch("location")

    if @company.valid?
      @company.save

      redirect_to("/companies/" + @company.id.to_s, { :notice => "Company updated successfully." })
    else
      render("company_templates/prefilled_form.html.erb")
    end
  end

  def remove_row
    @company = Company.where({ :id => params.fetch("id_to_remove") }).first

    @company.destroy

    redirect_to("/companies", { :notice => "Company deleted successfully." })
  end
end
