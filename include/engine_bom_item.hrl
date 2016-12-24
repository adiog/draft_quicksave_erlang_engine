% This file is a part of quicksave project.
% Copyright (c) 2016 Aleksander Gajewski <adiog@brainfuck.pl>.


-record(item, {item_id,
               user_id,
               item_type,
               title,
               url,
               freetext,
               author,
               source_title,
               source_url,
               timestamp}).
