*** Settings ***


*** Variables ***


${input_field_locator}                          xpath://*[@id="todo-input"]
${added_element_locator}                        xpath=//*[@id="root"]/main/ul/li/div/label
${active_tab_locator}                           xpath=//*[@id="root"]/footer/ul/li[2]/a
${all_tab_locator}                              xpath=//*[@id="root"]/footer/ul/li[1]/a
${completed_tab_locator}                        xpath=//*[@id="root"]/footer/ul/li[3]/a
${clear_completed_tab_locator}                  xpath=//*[@id="root"]/footer/button
${todo_item_checkbox_locator}                   xpath=//*[@id="root"]/main/ul/li[1]/div/input
${todo_item_number_of_item_text_locator}        xpath=//*[@id="root"]/footer/span
${todo_element_count_locator}                   xpath=//*[@id="root"]/main/ul/li
${todo_element_edit_field_locator}                   xpath=//*[@id="root"]/main/ul/li[1]/div/div
${todo_item_list_view_locator}                     xpath=//*[@id="root"]/main/ul/li/div/input
${todo_list_container_locator}                     xpath=//*[@id="root"]/main/ul

