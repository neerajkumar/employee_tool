class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_employee!

  # GET /projects
  # GET /projects.json
  def index
    @projects = current_employee.projects
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @logged_hour = LoggedHour.new
    @project = Project.find(params[:id])
    @logged_hour_types = @project.logged_hour_types
    if current_employee.is_admin?
      @members = @project.employees.uniq
      @resource = @project.employees.new

      respond_to do |format|
        format.html {}
      end
    end
  end

  # GET /projects/new
  def new
    @project = Project.new if current_employee.is_admin?
  end

  # GET /projects/1/edit
  def edit
    @project = current_employee.projects.find(params[:id]) if current_employee.is_admin?
    @project.logged_hour_types.build
  end

  # POST /projects
  # POST /projects.json
  def create
    if current_employee.is_admin?
      @project = Project.new(name: project_params[:name])

      respond_to do |format|
        if @project.valid? && current_employee.projects << @project
          format.html { redirect_to projects_path, alert: "Project Successfully Created"}
        else
          format.html { render action: :new}
        end
      end
    end 
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    if current_employee.is_admin?
      @project = current_employee.projects.find(params[:id])

      respond_to do |format|
        if @project.update(project_params) 
          format.html { redirect_to projects_path, alert: "Project Successfully Updated"}
        else
          format.html { render action: :new}
        end
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    if current_employee.is_admin?
      @project.destroy
      respond_to do |format|
        format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name)
    end
end
