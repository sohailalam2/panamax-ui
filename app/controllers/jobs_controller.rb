class JobsController < ApplicationController
  respond_to :html

  def new
    @template = JobTemplate.find(params[:template_id])
    @job = Job.new_from_template(@template)
    render layout: 'modal'
  end

  def create
    @job = Job.nested_create(params[:job])
    respond_with @job, location: deployment_targets_url
  end
end
