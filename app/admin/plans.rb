ActiveAdmin.register Plan do
  permit_params :name, :plan_type, :day_price, :week_price, :daily_text, :weekly_text, :description_list

  form do |f|
    f.inputs "Callout" do
      f.input :name
      f.input :plan_type
      f.input :day_price
      f.input :week_price
      f.input :daily_text
      f.input :weekly_text
      f.input :description_list, input_html: {value: "#{f.object.description_list.any? ? f.object.description_list.map(&:inspect).join(', ').delete('') : ''}", disabled: true}
      f.actions
    end
  end
end
