#!/bin/bash
# ComfyUI launcher - system package, data in ~/.cache/comfyui, config in ~/.config/comfyui

PREFIX="/opt/comfyui"
CONFIG_DIR="$HOME/.config/comfyui"
CACHE_DIR="$HOME/.cache/comfyui"
DEFAULT_CONFIG="/usr/share/comfyui/extra_model_paths.yaml.default"

user_provided_temp=false
user_provided_input=false
user_provided_output=false
user_provided_user_dir=false
user_provided_database_url=false
user_provided_extra_config=false

filtered_args=()
for arg in "$@"; do
    case "$arg" in
        --enable-manager|--disable-manager-ui|--windows-standalone-build|--quick-test-for-ci)
            echo "Warning: Option '$arg' is disabled in the system package. Ignored." >&2
            ;;
        --output-directory)
            user_provided_output=true
            filtered_args+=("$arg")
            ;;
        --input-directory)
            user_provided_input=true
            filtered_args+=("$arg")
            ;;
        --temp-directory)
            user_provided_temp=true
            filtered_args+=("$arg")
            ;;
        --extra-model-paths-config)
            user_provided_extra_config=true
            filtered_args+=("$arg")
            ;;
        --user-directory)
            user_provided_user_dir=true
            filtered_args+=("$arg")
            ;;
        --database-url)
            user_provided_database_url=true
            filtered_args+=("$arg")
            ;;
        *)
            filtered_args+=("$arg")
            ;;
    esac
done

if [[ "$user_provided_extra_config" == false ]]; then
    mkdir -p "$CONFIG_DIR"
    if [[ ! -f "$CONFIG_DIR/extra_model_paths.yaml" ]]; then
        if [[ -f "$DEFAULT_CONFIG" ]]; then
            cp "$DEFAULT_CONFIG" "$CONFIG_DIR/extra_model_paths.yaml"
            echo "Created default config at $CONFIG_DIR/extra_model_paths.yaml"
        else
            echo "Warning: Default config not found at $DEFAULT_CONFIG" >&2
        fi
    fi
    filtered_args+=("--extra-model-paths-config" "$CONFIG_DIR/extra_model_paths.yaml")
fi

mkdir -p "$CACHE_DIR"/{output,input}
mkdir -p "$CONFIG_DIR"/user
mkdir -p "$CONFIG_DIR"/models/{audio_encoders,clip,configs,diffusers,embeddings,gligen,latent_upscale_models,model_patches,style_models,unet,vae,checkpoints,clip_vision,controlnet,diffusion_models,frame_interpolation,hypernetworks,loras,photomaker,text_encoders,upscale_models,vae_approx}

if [[ "$user_provided_output" == false ]]; then
    filtered_args+=("--output-directory" "$CACHE_DIR/output")
fi
if [[ "$user_provided_input" == false ]]; then
    filtered_args+=("--input-directory" "$CACHE_DIR/input")
fi
if [[ "$user_provided_user_dir" == false ]]; then
    filtered_args+=("--user-directory" "$CONFIG_DIR/user")
fi
if [[ "$user_provided_temp" == false ]]; then
    filtered_args+=("--temp-directory" "/tmp")
fi
if [[ "$user_provided_database_url" == false ]]; then
    filtered_args+=("--database-url" "sqlite:///$CONFIG_DIR/user/comfyui.db")
fi

exec python "$PREFIX/main.py" "${filtered_args[@]}"
