class BusstopsController < ApplicationController

	def new
		@busstop = Busstop.new
	end

	def create
		@busstop = Busstop.new(params[:busstop])

		fieldParams = Hash.new
        fieldParams = {:bus_stop_lat_long => @busstop.bus_stop_lat_long}
        @busstop.valid?
        resultHash = Hash.new
        errorResult = @busstop.validateLatLong(fieldParams)
        errorResult.each do |key, value|
            @busstop.errors.add(key, 'Improper \'LatLong\' format')
        end
		
		if @busstop.save
			redirect_to busstops_path
		else
			render new_busstop_path
		end
	end

	def index
		@busstop = Busstop.all
	end

	def edit
		@busstop = Busstop.find(params[:id])
	end

	def update
		@busstop = Busstop.find(params[:id])

    	respond_to do |format|
	    	if @busstop.update_attributes(params[:busstop])
	        	format.html { redirect_to @busstop, notice: 'Busstop was successfully updated.' }
	        	format.json { head :no_content }
	      	else
		        format.html { render action: "edit" }
		        format.json { render json: @busstop.errors, status: :unprocessable_entity }
		    end
		end
    end

	def show
		@busstop = Busstop.find(params[:id])
	end

	def destroy
		@busstop = Busstop.find(params[:id])
		if @busstop.destroy
			redirect_to busstops_path
		end
	end

end