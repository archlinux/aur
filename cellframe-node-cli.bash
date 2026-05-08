#!/usr/bin/env bash

CFCLI_PREFIX="/opt/cellframe-node"

# Reads the values from the default config file
_cfcli_cfg() {
    local section="$1" key="$2" default="$3"
    local cfg="${CFCLI_PREFIX}/etc/cellframe-node.cfg"
    [[ -f "$cfg" ]] || { echo "$default"; return; }
    local in_section=false val=""
    while IFS= read -r line; do
        line="${line%%#*}"
        line="${line// /}"
        [[ -z "$line" ]] && continue
        if [[ "$line" == "[$section]" ]]; then
            in_section=true; continue
        elif [[ "$line" == \[*\] ]]; then
            $in_section && break
            continue
        fi
        if $in_section && [[ "$line" == "${key}="* ]]; then
            val="${line#*=}"
            break
        fi
    done < "$cfg"
    if [[ -z "$val" ]]; then
        echo "$default"
    elif [[ "$val" == ../* ]]; then
        echo "${CFCLI_PREFIX}/etc/${val}"
    else
        echo "$val"
    fi
}

_cfcli_wallets_path() { _cfcli_cfg resources wallets_path "${CFCLI_PREFIX}/var/lib/wallet"; }
_cfcli_ca_path()      { _cfcli_cfg resources ca_folders    "${CFCLI_PREFIX}/var/lib/ca"; }

_cfcli_networks() {
    local d="${CFCLI_PREFIX}/etc/network"
    [[ -d "$d" ]] || return
    for f in "$d"/*.cfg; do
        [[ -f "$f" ]] && basename "$f" .cfg
    done
}

_cfcli_certs() {
    local raw; raw="$(_cfcli_ca_path)"
    raw="${raw#\[}"; raw="${raw%\]}"
    local IFS=','
    for d in $raw; do
        [[ "$d" == ../* ]] && d="${CFCLI_PREFIX}/etc/${d}"
        [[ -d "$d" ]] || continue
        for f in "$d"/*.dcert; do
            [[ -f "$f" ]] && basename "$f" .dcert
        done
    done
}

_cfcli_wallets() {
    local d; d="$(_cfcli_wallets_path)"
    [[ "$d" == ../* ]] && d="${CFCLI_PREFIX}/etc/${d}"
    [[ -d "$d" ]] || return
    for f in "$d"/*.dwallet; do
        [[ -f "$f" ]] && basename "$f" .dwallet
    done
}

_cfcli_chains() {
    local net="$1"
    for f in "${CFCLI_PREFIX}/etc/network/${net}/chain-"*.cfg; do
        [[ -f "$f" ]] || continue
        grep -m1 '^name=' "$f" 2>/dev/null | cut -d= -f2
    done
}

_cfcli_get_opt() {
    local flag="$1"
    local i
    for (( i=1; i < cword; i++ )); do
        if [[ "${words[i]}" == "$flag" && $((i+1)) -lt ${#words[@]} ]]; then
            echo "${words[i+1]}"
            return
        fi
    done
}

_cfcli_compgen() {
    COMPREPLY=( $(compgen -W "$1" -- "$cur") )
}

_cfcli_global_db() {
    local subcmds="flush write read delete group_list drop_table get_keys clear"
    case "${words[2]}" in
        write)   _cfcli_compgen "-group -key -value" ;;
        read|delete|drop_table|get_keys)
                 _cfcli_compgen "-group -key" ;;
        group_list) _cfcli_compgen "-mask -all -h" ;;
        clear)   _cfcli_compgen "-group -mask -all -pinned" ;;
        *)       _cfcli_compgen "$subcmds" ;;
    esac
}

_cfcli_node() {
    local subcmds="add del link alias connect handshake connections balancer dump list ban unban banlist"
    case "${words[2]}" in
        add)     _cfcli_compgen "-net -port" ;;
        del)     _cfcli_compgen "-net -addr -alias" ;;
        link)    if [[ "${words[3]}" == "add" || "${words[3]}" == "del" ]]; then
                     _cfcli_compgen "-net -addr -alias -link"
                 else
                     _cfcli_compgen "add del"
                 fi ;;
        alias)   _cfcli_compgen "-addr -alias" ;;
        connect) _cfcli_compgen "-net -addr -alias auto" ;;
        handshake) _cfcli_compgen "-net -addr -alias" ;;
        connections) _cfcli_compgen "-net" ;;
        balancer) _cfcli_compgen "-net" ;;
        dump)    _cfcli_compgen "-net -addr" ;;
        list)    _cfcli_compgen "-net -addr -alias -full" ;;
        ban|unban) _cfcli_compgen "-net -certs -addr -host" ;;
        *)       _cfcli_compgen "$subcmds" ;;
    esac
}

_cfcli_wallet() {
    local subcmds="list new info activate deactivate outputs convert find shared"
    case "${words[2]}" in
        new)     _cfcli_compgen "-w -sign -restore -restore_legacy -net -force -password" ;;
        info)    _cfcli_compgen "-addr -w -net" ;;
        activate) _cfcli_compgen "-w -password -ttl" ;;
        deactivate) _cfcli_compgen "-w" ;;
        outputs) _cfcli_compgen "-addr -w -net -token -cond -type -value -mempool_check" ;;
        convert) _cfcli_compgen "-w -password -remove_password" ;;
        find)    _cfcli_compgen "-addr -file" ;;
        shared)
            local shared_subcmds="hold refill take sign info list"
            case "${words[3]}" in
                hold)   _cfcli_compgen "-net -w -token -value -fee -signs_minimum -pkey_hashes -tag -H" ;;
                refill) _cfcli_compgen "-net -w -value -fee -tx -H" ;;
                take)   _cfcli_compgen "-net -w -tx -to_addr -value -fee -H" ;;
                sign)   _cfcli_compgen "-net -w -cert -tx -H" ;;
                info)   _cfcli_compgen "-net -tx -H" ;;
                list)   _cfcli_compgen "-net -pkey -addr -w -cert -local -H" ;;
                *)      _cfcli_compgen "$shared_subcmds" ;;
            esac ;;
        *)       _cfcli_compgen "$subcmds" ;;
    esac
}

_cfcli_net() {
    local subcmds="list go get stats sync link ca ledger poa_certs"
    case "${words[2]}" in
        list)    _cfcli_compgen "chains -net" ;;
        go)      _cfcli_compgen "online offline sync -net" ;;
        get)     _cfcli_compgen "status fee id -net" ;;
        stats)   _cfcli_compgen "tx tps -net -from -to -prev_sec" ;;
        sync)    _cfcli_compgen "all gdb chains -net -mode" ;;
        link)    _cfcli_compgen "list add del info disconnect_all -net -addr" ;;
        ca)
            case "${words[3]}" in
                add)  _cfcli_compgen "-net -cert -hash" ;;
                list) _cfcli_compgen "-net" ;;
                del)  _cfcli_compgen "-net -hash -H" ;;
                *)    _cfcli_compgen "add list del" ;;
            esac ;;
        ledger)  _cfcli_compgen "reload -net" ;;
        poa_certs) _cfcli_compgen "list -net" ;;
        *)       _cfcli_compgen "$subcmds" ;;
    esac
}

_cfcli_block() {
    local subcmds="new new_datum_add new_datum_del new_datum_list new_datum dump list count last find fee reward autocollect"
    case "${words[2]}" in
        dump)    _cfcli_compgen "-net -chain -hash -num -brief -H" ;;
        list)    _cfcli_compgen "signed first_signed -net -chain -limit -offset -head -h -from_hash -to_hash -from_date -to_date -cert -pkey_hash -unspent" ;;
        count)   _cfcli_compgen "-net -chain" ;;
        last)    _cfcli_compgen "-net -chain" ;;
        find)    _cfcli_compgen "-net -chain -datum" ;;
        fee)     _cfcli_compgen "collect -net -chain -cert -addr -hashes -fee" ;;
        reward)
            case "${words[3]}" in
                set)  _cfcli_compgen "-net -chain -poa_cert -value" ;;
                show) _cfcli_compgen "-net -chain" ;;
                collect) _cfcli_compgen "-net -chain -cert -addr -hashes -fee" ;;
                *)    _cfcli_compgen "set show collect" ;;
            esac ;;
        autocollect)
            case "${words[3]}" in
                status) _cfcli_compgen "-net" ;;
                renew)  _cfcli_compgen "-net -chain -cert -addr -fee" ;;
                *)      _cfcli_compgen "status renew" ;;
            esac ;;
        new)     _cfcli_compgen "-net -chain" ;;
        new_datum_add|new_datum_del) _cfcli_compgen "-net -chain" ;;
        new_datum_list) _cfcli_compgen "-net -chain" ;;
        new_datum) _cfcli_compgen "-net -chain" ;;
        *)       _cfcli_compgen "$subcmds" ;;
    esac
}

_cfcli_dag() {
    local subcmds="event round"
    case "${words[2]}" in
        event)
            case "${words[3]}" in
                sign) _cfcli_compgen "-net -chain -event" ;;
                dump) _cfcli_compgen "-net -chain -event -from -H" ;;
                list) _cfcli_compgen "-net -chain -from -limit -offset -head -h -from_hash -to_hash -from_date -to_date -H" ;;
                count) _cfcli_compgen "-net -chain" ;;
                last) _cfcli_compgen "-net -chain" ;;
                find) _cfcli_compgen "-net -chain -datum" ;;
                *)    _cfcli_compgen "sign dump list count last find" ;;
            esac ;;
        round)
            case "${words[3]}" in
                complete) _cfcli_compgen "-net -chain" ;;
                find)     _cfcli_compgen "-net -chain -datum" ;;
                *)        _cfcli_compgen "complete find" ;;
            esac ;;
        *)       _cfcli_compgen "$subcmds" ;;
    esac
}

_cfcli_token() {
    local subcmds="list info"
    case "${words[2]}" in
        list) _cfcli_compgen "-net -full -h" ;;
        info) _cfcli_compgen "-net -name -history_limit -h" ;;
        *)    _cfcli_compgen "$subcmds" ;;
    esac
}

_cfcli_token_decl() {
    _cfcli_compgen "-net -chain -token -type -total_supply -decimals -signs_total -signs_emission -certs -flags -total_signs_valid -description -datum_type_allowed -datum_type_blocked -tx_receiver_allowed -tx_receiver_blocked -tx_sender_allowed -tx_sender_blocked"
}

_cfcli_token_update() {
    _cfcli_compgen "-net -chain -token -type -total_supply_change -certs -flag_set -flag_unset -total_signs_valid -description -tx_receiver_allowed -tx_receiver_blocked -tx_sender_allowed -tx_sender_blocked -utxo_blocked_add -utxo_blocked_remove -utxo_blocked_clear -add_cert -remove_certs"
}

_cfcli_token_decl_sign() {
    _cfcli_compgen "-net -chain -datum -certs"
}

_cfcli_token_update_sign() {
    _cfcli_compgen "-net -chain -datum -certs"
}

_cfcli_token_emit() {
    _cfcli_compgen "sign -net -chain_emission -token -emission -emission_value -addr -certs"
}

_cfcli_token_emit_sign() {
    _cfcli_compgen "-net -chain -datum -certs"
}

_cfcli_mempool() {
    local subcmds="list check proc proc_all delete dump add_ca sign count"
    case "${words[2]}" in
        list)     _cfcli_compgen "-net -chain -addr -brief -limit -offset -h" ;;
        check)    _cfcli_compgen "-net -chain -datum -cert -file -hash -mime" ;;
        proc)     _cfcli_compgen "-net -chain -datum" ;;
        proc_all) _cfcli_compgen "-net -chain" ;;
        delete)   _cfcli_compgen "-net -chain -datum" ;;
        dump)     _cfcli_compgen "-net -chain -datum" ;;
        add_ca)   _cfcli_compgen "-net -chain -ca_name" ;;
        sign)     _cfcli_compgen "-cert -net -chain -file -mime" ;;
        count)    _cfcli_compgen "-net -chain" ;;
        *)        _cfcli_compgen "$subcmds" ;;
    esac
}

_cfcli_tx_create() {
    _cfcli_compgen "-net -chain -value -token -to_addr -from_wallet -from_emission -cert -wallet_fee -fee -certs -arbitrage -lock_before"
}

_cfcli_tx_create_json() {
    _cfcli_compgen "-net -chain -json"
}

_cfcli_mempool_add() {
    _cfcli_compgen "-net -chain -json -tx_obj"
}

_cfcli_tx_cond() {
    local subcmds="create refill remove unspent_find info list history"
    case "${words[2]}" in
        create)       _cfcli_compgen "-net -token -w -cert -pkey -value -fee -unit -srv_uid" ;;
        refill)       _cfcli_compgen "-net -w -tx -value -fee -H" ;;
        remove)       _cfcli_compgen "-net -w -hashes -fee -srv_uid" ;;
        unspent_find) _cfcli_compgen "-net -w -srv_uid" ;;
        info)         _cfcli_compgen "-net -tx -H" ;;
        list)         _cfcli_compgen "-net -w -addr -pkey -pkey_cert -status -H" ;;
        history)      _cfcli_compgen "-net -tx -action -H" ;;
        *)            _cfcli_compgen "$subcmds" ;;
    esac
}

_cfcli_tx_verify() {
    _cfcli_compgen "-net -chain -tx"
}

_cfcli_tx_sign() {
    _cfcli_compgen "-net -chain -tx -certs -H"
}

_cfcli_tx_history() {
    _cfcli_compgen "-addr -w -net -chain -limit -offset -head -h -all -tx -count"
}

_cfcli_ledger() {
    local subcmds="list info event"
    case "${words[2]}" in
        list)
            case "${words[3]}" in
                coins)     _cfcli_compgen "-net -limit -offset -h" ;;
                threshold) _cfcli_compgen "-net -hash -limit -offset -head" ;;
                balance)   _cfcli_compgen "-net -limit -offset -head" ;;
                *)         _cfcli_compgen "coins threshold balance" ;;
            esac ;;
        info)  _cfcli_compgen "-hash -net -unspent" ;;
        event)
            case "${words[3]}" in
                list)   _cfcli_compgen "-net -group" ;;
                dump)   _cfcli_compgen "-net -hash" ;;
                create) _cfcli_compgen "-net -chain -w -service_key -srv_uid -group -event_type -event_data -fee -H" ;;
                key)
                    case "${words[4]}" in
                        add|remove) _cfcli_compgen "-net -hash -certs" ;;
                        list)       _cfcli_compgen "-net -H" ;;
                        *)          _cfcli_compgen "add remove list" ;;
                    esac ;;
                *)      _cfcli_compgen "list dump create key" ;;
            esac ;;
        *)     _cfcli_compgen "$subcmds" ;;
    esac
}

_cfcli_srv_stake() {
    local subcmds="order delegate update invalidate approve pkey_update list min_value max_weight check reward"
    case "${words[2]}" in
        order)
            case "${words[3]}" in
                create)
                    case "${words[4]}" in
                        fee)       _cfcli_compgen "-net -value -cert -H" ;;
                        validator) _cfcli_compgen "-net -value_min -value_max -tax -cert -node_addr -H" ;;
                        staker)    _cfcli_compgen "-net -value -w -fee -addr -cert -node_addr -H" ;;
                        *)         _cfcli_compgen "fee validator staker" ;;
                    esac ;;
                list)   _cfcli_compgen "fee validator staker -net -H -h" ;;
                remove) _cfcli_compgen "-net -order -H" ;;
                *)      _cfcli_compgen "create list remove" ;;
            esac ;;
        delegate)   _cfcli_compgen "-net -w -cert -value -fee -node_addr -order -H" ;;
        update)     _cfcli_compgen "-net -w -cert -value -fee -H" ;;
        invalidate) _cfcli_compgen "-net -tx -poa_cert -H" ;;
        approve)    _cfcli_compgen "-net -tx -poa_cert -H" ;;
        pkey_update) _cfcli_compgen "-net -pkey_full -pkey_hash -signing_pkey_type" ;;
        list)
            case "${words[3]}" in
                keys) _cfcli_compgen "-net -full -h -cert -pkey_hash" ;;
                tx)   _cfcli_compgen "-net -h -cert -pkey_hash -brief -limit -offset -date_from -date_to" ;;
                *)    _cfcli_compgen "keys tx" ;;
            esac ;;
        min_value)  _cfcli_compgen "-net -poa_cert -value -H" ;;
        max_weight) _cfcli_compgen "-net -poa_cert -value -H" ;;
        check)      _cfcli_compgen "-net -addr" ;;
        reward)     _cfcli_compgen "-net" ;;
        *)          _cfcli_compgen "$subcmds" ;;
    esac
}

_cfcli_stake_lock() {
    local subcmds="hold take"
    case "${words[2]}" in
        hold) _cfcli_compgen "-net -chain -w -time_staking -token -value -fee -reinvest" ;;
        take) _cfcli_compgen "-net -chain -w -tx -fee" ;;
        *)    _cfcli_compgen "$subcmds" ;;
    esac
}

_cfcli_srv_xchange() {
    local subcmds="order orders"
    case "${words[2]}" in
        order)
            case "${words[3]}" in
                remove) _cfcli_compgen "-net -order -w -fee" ;;
                *)      _cfcli_compgen "remove" ;;
            esac ;;
        orders) _cfcli_compgen "-net -addr -seller" ;;
        *)      _cfcli_compgen "$subcmds" ;;
    esac
}

_cfcli_poll() {
    local subcmds="create cancel vote list dump"
    case "${words[2]}" in
        create) _cfcli_compgen "-net -question -options -expire -max_votes_count -delegated_key_required -vote_changing_allowed -fee -w -token" ;;
        cancel) _cfcli_compgen "-net -hash -fee -w" ;;
        vote)   _cfcli_compgen "-net -hash -option_idx -cert -fee -w" ;;
        list)   _cfcli_compgen "-net -token" ;;
        dump)   _cfcli_compgen "-net -hash" ;;
        *)      _cfcli_compgen "$subcmds" ;;
    esac
}

_cfcli_esbocs() {
    local subcmds="min_validators_count check_signs_structure emergency_validators status empty_block_every_times"
    case "${words[2]}" in
        min_validators_count)
            case "${words[3]}" in
                set)  _cfcli_compgen "-net -chain -cert -val_count" ;;
                show) _cfcli_compgen "-net -chain" ;;
                *)    _cfcli_compgen "set show" ;;
            esac ;;
        check_signs_structure)
            case "${words[3]}" in
                enable|disable) _cfcli_compgen "-net -chain -cert" ;;
                show) _cfcli_compgen "-net -chain" ;;
                *)    _cfcli_compgen "enable disable show" ;;
            esac ;;
        emergency_validators)
            case "${words[3]}" in
                add|remove) _cfcli_compgen "-net -chain -cert -pkey_hash" ;;
                show) _cfcli_compgen "-net -chain" ;;
                *)    _cfcli_compgen "add remove show" ;;
            esac ;;
        status) _cfcli_compgen "-net -chain" ;;
        empty_block_every_times)
            case "${words[3]}" in
                set)  _cfcli_compgen "-net -chain -cert -round_count" ;;
                show) _cfcli_compgen "-net -chain" ;;
                *)    _cfcli_compgen "set show" ;;
            esac ;;
        *)      _cfcli_compgen "$subcmds" ;;
    esac
}

_cfcli_dag_poa() {
    case "${words[2]}" in
        event)
            case "${words[3]}" in
                sign) _cfcli_compgen "-net -chain -event -H" ;;
                *)    _cfcli_compgen "sign" ;;
            esac ;;
        *)  _cfcli_compgen "event" ;;
    esac
}

_cfcli_decree() {
    local subcmds="create sign anchor find info"
    case "${words[2]}" in
        create)
            case "${words[3]}" in
                common)  _cfcli_compgen "-net -chain -decree_chain -certs -fee -to_addr -new_certs -signs_verify" ;;
                service) _cfcli_compgen "-net -chain -decree_chain -srv_id -certs -fee -to_addr -new_certs -signs_verify" ;;
                *)       _cfcli_compgen "common service" ;;
            esac ;;
        sign)   _cfcli_compgen "-net -chain -datum -certs" ;;
        anchor) _cfcli_compgen "-net -chain -datum -certs" ;;
        find)   _cfcli_compgen "-net -hash" ;;
        info)   _cfcli_compgen "-net" ;;
        *)      _cfcli_compgen "$subcmds" ;;
    esac
}

_cfcli_find() {
    local subcmds="datum atom decree"
    case "${words[2]}" in
        datum)  _cfcli_compgen "-net -chain -hash" ;;
        atom)   _cfcli_compgen "-net -chain -hash" ;;
        decree) _cfcli_compgen "-net -chain -type -where" ;;
        *)      _cfcli_compgen "$subcmds" ;;
    esac
}

_cfcli_remove() {
    _cfcli_compgen "-gdb -chains -net -all"
}

_cfcli_policy() {
    local subcmds="activate deactivate find list"
    case "${words[2]}" in
        activate)   _cfcli_compgen "execute -net -num -ts_start -block_start -chain -certs" ;;
        deactivate) _cfcli_compgen "execute -net -num -certs" ;;
        find)       _cfcli_compgen "-net -num" ;;
        list)       _cfcli_compgen "-net" ;;
        *)          _cfcli_compgen "$subcmds" ;;
    esac
}

_cfcli_exec_cmd() {
    _cfcli_compgen "-net -addr -cmd"
}

_cfcli_print_log() {
    _cfcli_compgen "ts_after limit"
}

_cfcli_stats() {
    _cfcli_compgen "cpu"
}

_cfcli_help() {
    [[ $cword -eq 2 ]] && _cfcli_compgen "$(_cfcli_commands)"
}

_cfcli_gdb_export() {
    _cfcli_compgen "filename -groups"
}

_cfcli_gdb_import() {
    _cfcli_compgen "filename"
}

_cfcli_srv_dex() {
    local subcmds="order orders orderbook status pairs tvl spread slippage find_matches history purchase purchase_multi purchase_auto cancel_all_by_seller migrate decree"
    case "${words[2]}" in
        order)
            case "${words[3]}" in
                create) _cfcli_compgen "-net -token_sell -token_buy -w -unsigned -addr -value -rate -fee -fill_policy -min_fill_pct -min_fill_value -H" ;;
                remove) _cfcli_compgen "-net -order -w -unsigned -addr -fee" ;;
                update) _cfcli_compgen "-net -order -w -unsigned -addr -value -fee" ;;
                *)      _cfcli_compgen "create remove update" ;;
            esac ;;
        orders)          _cfcli_compgen "-net -pair -seller -addr -limit -offset -H" ;;
        orderbook)       _cfcli_compgen "-net -pair -depth -tick_price -tick -cumulative" ;;
        status)          _cfcli_compgen "-net -pair -seller" ;;
        pairs)           _cfcli_compgen "-net" ;;
        tvl)             _cfcli_compgen "-net -token -by -top" ;;
        spread)          _cfcli_compgen "-net -pair -verbose" ;;
        slippage)        _cfcli_compgen "-net -pair -value -side -unit -max_slippage_pct" ;;
        find_matches)    _cfcli_compgen "-net -order -addr" ;;
        history)         _cfcli_compgen "-net -pair -from -to -limit -offset -view -type -bucket -fill" ;;
        purchase)        _cfcli_compgen "-net -order -w -addr -unsigned -value -fee -unit -create_leftover_order -leftover_rate -leftover_fill_policy -leftover_min_fill_pct -H" ;;
        purchase_multi)  _cfcli_compgen "-net -orders -w -addr -unsigned -value -fee -unit -create_leftover_order -leftover_rate -leftover_fill_policy -H" ;;
        purchase_auto)   _cfcli_compgen "-net -token_sell -token_buy -w -addr -unsigned -value -fee -rate_cap -unit -create_leftover_order -dry-run -H" ;;
        cancel_all_by_seller) _cfcli_compgen "-net -pair -seller -side -dry-run -w -fee" ;;
        migrate)         _cfcli_compgen "-net -from -token_sell -token_buy -rate -fee -w" ;;
        decree)          _cfcli_compgen "-net -w -service_key -fee -method -fee_amount -fee_addr -token_base -token_quote -net_base -net_quote -fee_pct -fee_native -fee_config" ;;
        *)               _cfcli_compgen "$subcmds" ;;
    esac
}

_cfcli_net_srv() {
    local subcmds="order get_limits report"
    case "${words[2]}" in
        order)
            case "${words[3]}" in
                find)   _cfcli_compgen "-net -direction -srv_uid -price_unit -price_token -price_min -price_max" ;;
                delete) _cfcli_compgen "-net -hash" ;;
                dump)   _cfcli_compgen "-net -hash" ;;
                create) _cfcli_compgen "-net -direction -srv_uid -price -price_unit -price_token -units -node_addr -tx_cond -expires -cert -ext -region -continent" ;;
                *)      _cfcli_compgen "find delete dump create" ;;
            esac ;;
        get_limits) _cfcli_compgen "-net -srv_uid -provider_pkey_hash -client_pkey_hash" ;;
        *)          _cfcli_compgen "$subcmds" ;;
    esac
}

_cfcli_stake_ext() {
    local subcmds="lock unlock info events stats"
    case "${words[2]}" in
        lock)   _cfcli_compgen "-net -stake_ext -amount -lock_period -position -fee -w" ;;
        unlock) _cfcli_compgen "-net -lock_tx_hash -fee -w" ;;
        info)   _cfcli_compgen "-net -stake_ext" ;;
        events) _cfcli_compgen "-net -stake_ext -type" ;;
        stats)  _cfcli_compgen "-net" ;;
        *)      _cfcli_compgen "$subcmds" ;;
    esac
}

_cfcli_plugins() {
    # Get plugin names from the running node
    local output
    output="$(cellframe-node-cli plugin list 2>/dev/null)" && \
        echo "$output" | sed -n 's/^|[[:space:]]*\([a-zA-Z_][a-zA-Z_0-9-]*\)[[:space:]]*|.*/\1/p' && return
    # Fallback: scan plugins dir from config
    local d; d="$(_cfcli_cfg plugins py_path "${CFCLI_PREFIX}/var/lib/plugins")"
    [[ "$d" == ../* ]] && d="${CFCLI_PREFIX}/etc/${d}"
    [[ -d "$d" ]] || return
    for f in "$d"/*/; do
        [[ -d "$f" ]] && basename "$f"
    done
}

_cfcli_plugin() {
    local subcmds="list show restart reload"
    case "${words[2]}" in
        show|reload) [[ $cword -eq 3 ]] && _cfcli_compgen "$(_cfcli_plugins)" ;;
        list|restart) ;;
        *)  _cfcli_compgen "$subcmds" ;;
    esac
}

_cfcli_vpn_client() {
    _cfcli_compgen "-net -addr -token -value -w"
}

_cfcli_chain_ca_pub() {
    _cfcli_compgen "-net -chain -ca_name"
}

_cfcli_complete_flag_value() {
    case "$prev" in
        -net)
            _cfcli_compgen "$(_cfcli_networks)" ; return 0 ;;
        -chain)
            local net=$(_cfcli_get_opt "-net")
            if [[ -n "$net" ]]; then
                _cfcli_compgen "$(_cfcli_chains "$net")"
            fi ; return 0 ;;
        -w|-from_wallet|-wallet_fee)
            _cfcli_compgen "$(_cfcli_wallets)" ; return 0 ;;
        -cert|-certs|-poa_cert|-add_cert|-new_certs|-ca_name|-service_key)
            _cfcli_compgen "$(_cfcli_certs)" ; return 0 ;;
        -sign)
            _cfcli_compgen "sig_dil sig_bliss sig_tesla sig_picnic" ; return 0 ;;
        -H)
            _cfcli_compgen "hex base58" ; return 0 ;;
        -type)
            _cfcli_compgen "private CF20 simple" ; return 0 ;;
        -status)
            _cfcli_compgen "all spent unspent" ; return 0 ;;
        -action)
            _cfcli_compgen "all refill spend" ; return 0 ;;
        -unit)
            _cfcli_compgen "B SEC base quote buy sell" ; return 0 ;;
        -side)
            _cfcli_compgen "buy sell ask bid" ; return 0 ;;
        -fill_policy|-leftover_fill_policy)
            _cfcli_compgen "AON min min_from_origin" ; return 0 ;;
        -view)
            _cfcli_compgen "events summary ohlc volume stats" ; return 0 ;;
        -mode)
            _cfcli_compgen "update all" ; return 0 ;;
        -method)
            _cfcli_compgen "fee_set pair_add pair_remove pair_fee_set pair_fee_set_all" ; return 0 ;;
        -where)
            _cfcli_compgen "chains mempool" ; return 0 ;;
        -from)
            if [[ "${words[1]}" == "dag" ]]; then
                _cfcli_compgen "events events_lasts threshold round.new"
            fi ; return 0 ;;
        -json|-file)
            _filedir ; return 0 ;;
    esac
    return 1
}

_cfcli_srv_datum() {
    local subcmds="datum"
    case "${words[2]}" in
        datum)
            case "${words[3]}" in
                save|load) _cfcli_compgen "-net -chain -datum" ;;
                *)         _cfcli_compgen "save load" ;;
            esac ;;
        *) _cfcli_compgen "$subcmds -net -chain" ;;
    esac
}

_cfcli_vpn_stat() {
    _cfcli_compgen "-net -full"
}

_cfcli_commands() {
    # try first with cli...
    local output
    output="$(cellframe-node-cli help 2>/dev/null)"
    if [[ $? -eq 0 ]] && ! echo "$output" | grep -qi "error"; then
        echo "$output" | sed -n 's/^\([a-z_][a-z_0-9]*\):.*/\1/p'
        return
    fi
    # ... fallback to static list
    echo "global_db node version help wallet net block dag dag_poa token token_decl token_update token_decl_sign token_update_sign token_emit token_emit_sign mempool mempool_add chain_ca_pub tx_create tx_create_json tx_cond tx_verify tx_sign tx_history ledger srv_stake stake_lock stake_ext srv_xchange srv_dex net_srv poll esbocs decree find remove exec_cmd policy print_log stats gdb_export gdb_import plugin vpn_client vpn_stat srv_datum exit"
}

_cellframe_node_cli() {
    local cur prev words cword
    _init_completion || return

    if [[ $cword -eq 1 ]]; then
        _cfcli_compgen "$(_cfcli_commands)"
        return
    fi

    _cfcli_complete_flag_value && return

    local cmd="${words[1]}"
    local func="_cfcli_${cmd//-/_}"
    if declare -f "$func" > /dev/null 2>&1; then
        "$func"
    fi
}

complete -F _cellframe_node_cli cellframe-node-cli
