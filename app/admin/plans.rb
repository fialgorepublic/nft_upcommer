ActiveAdmin.register Plan do
  permit_params :name, :plan_type, :day_price, :week_price, :daily_text, :image, :weekly_text, :description_list

  show do
    attributes_table do
      row :name
      row :plan_type
      row :day_price
      row "Image" do |plan|
        link_to image_tag(url_for(plan.image), height: '200px'), url_for(plan.image), target: :_blank if plan.image.attached?
      end
      row :week_price
      row :daily_text
      row :weekly_text
      row :day_price
      row :description_list
    end
  end

  
  form do |f|
    f.inputs "Callout" do
      f.input :name
      f.input :plan_type
      f.input :day_price
      f.input :week_price
      f.input :daily_text
      f.input :weekly_text
      f.input :description_list, input_html: {value: "#{f.object.description_list.any? ? f.object.description_list.map(&:inspect).join(', ').delete('') : ''}", disabled: true}
      f.input :image, as: :file
      f.actions
    end
  end
end
