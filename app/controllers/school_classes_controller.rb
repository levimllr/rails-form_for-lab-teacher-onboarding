class SchoolClassController < ApplicationController
  def index
    @school_classes = SchoolClass.all
  end

  def new
    @school_class = SchoolClass.new
  end

  def create
    @school_class = SchoolClass.new(school_class_params(:title, :room_number))
    @school_class.save
    redirect to school_class_path(@school_class)
  end

  def show
    @school_class.find(params[:id])
  end

  def edit
    @school_class = SchoolClass.find(params[:id])
  end

  def update
    @school_class = SchoolClass.find(params[:id])
    @school_class.update(school_class_params(:title))
    redirect_to school_class_path(@school_class)
  end

  def school_class_params(*args)
		params.require(:school_class).permit(*args)
	end
end