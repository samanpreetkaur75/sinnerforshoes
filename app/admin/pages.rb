# app/admin/pages.rb
ActiveAdmin.register Page do
    permit_params :title, :content, :page_type
  
    form do |f|
      f.inputs do
        f.input :title
        f.input :content, as: :text, input_html: { rows: 10 }
        f.input :page_type, as: :select, collection: ['Contact', 'About'], prompt: 'Select Page Type'
      end
      f.actions
    end
  
    # Show page for contact/about pages
    show do
      attributes_table do
        row :title
        row :content do |page|
          page.content.html_safe # Render the content as HTML
        end
      end
    end
  end
  