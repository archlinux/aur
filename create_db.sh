#!/bin/sh

CMD=$(cat <<EOF
:ok = :mnesia.create_schema([node()])
:ok = :mnesia.start()
{:atomic, :ok} = :mnesia.create_table(ContentLength, [attributes: [:path, :content_length],
                                                      disc_copies: [node()]])
EOF
)
ELIXIR_ERL_OPTIONS="-sname cpcache -mnesia dir '/var/cache/cpcache/mnesia'" /usr/bin/elixir -e "$CMD"
