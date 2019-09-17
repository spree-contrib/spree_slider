Deface::Override.new(
  virtual_path:  'spree/admin/shared/sub_menu/_configuration',
  name:          'spree_slider_admin_configurations_menu',
  insert_bottom: '[data-hook="admin_configurations_sidebar_menu"]',
  text: "<%- if spree_current_user.admin? %><%= configurations_sidebar_menu_item t('spree_slider.config_name'), admin_slides_path %><% end %>"
)

Deface::Override.new(
  virtual_path:  'spree/admin/shared/sub_menu/_configuration',
  name:          'spree_slider_location_admin_configurations_menu',
  insert_bottom: '[data-hook="admin_configurations_sidebar_menu"]',
  text: "<%- if spree_current_user.admin? %><%= configurations_sidebar_menu_item t('spree_slider_locations.config_name'), admin_slide_locations_path %><% end %>"
)
