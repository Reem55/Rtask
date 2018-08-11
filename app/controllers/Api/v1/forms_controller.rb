module Api
    module V1
        class FormsController < ApplicationController
            def index 
                forms = Form.order('created_at DESC');
                
                render json: {data: forms}, status: :ok
            end
            
            
            def show 
                form = Form.find(params[:id])

                render json: {data: form}, status: :ok
            end
            
            def create
                form = Form.new(form_params)
                
                if form.save
                    render json: {status: 'success', message: 'Form saved', data: form}, status: :ok   
                else
                    render json: {status: 'error', message: 'Form not saved', errors: form.errors}, status: :unprocessable_entity
                end
            end
            
            def update
                form = Form.find(params[:id])

                if form.update(form_params)
                    render json: {status: 'success', message:'Form updated', data: form}, status: :ok
                else
                    render json: {status: 'error', message:'Form not saved', errors: form.errors}, status: :unprocessable_entity
                end
            end

            def destroy
                form = Form.find(params[:id])

                form.destroy

                head :no_content
            end

            private
                def form_params
                    params.permit(:first_name, :last_name, :email, :subject, :description)
                end    
        end
    end 
end