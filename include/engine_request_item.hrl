% This file is a part of quicksave project.
% Copyright (c) 2016 Aleksander Gajewski <adiog@brainfuck.pl>.


-record(item_create_request, {item}).


-record(item_retrieve_request, {item_id}).


-record(item_update_request, {item_id, item}).


-record(item_delete_request, {item_id}).
