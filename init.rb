require_relative 'new_file'


first_item=ComputerGame.new("PC","fighting",16,28,"Mortal comat","Good game", 1000)
second_item=Book.new("Pero",100,"fiction","zalupa","bad book",50)
third_item=BoardGame.new("tut",3,8,4,"lord","dfsdf", 10)

new_order_viewer=OrderViewer.new
new_order_viewer.add_item(first_item)
new_order_viewer.add_item(second_item)
new_order_viewer.add_item(third_item)
new_order_viewer.show_order
new_order_viewer.export_order
new_order_reph=OrderRephository.new
new_order_reph.load_from_CSV

