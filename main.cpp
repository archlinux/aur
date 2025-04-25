#include <nana/gui.hpp>
#include <nana/gui/widgets/button.hpp>
#include <nana/gui/widgets/label.hpp>
#include <nana/gui/msgbox.hpp>
#include <nana/gui/place.hpp>
#include <nana/gui/filebox.hpp>
#include <nana/filesystem/filesystem.hpp>
#include <fstream>
#include <iostream>

std::string select_build_file(nana::window wd) {
    nana::filebox fb(wd, false);
    fb.title("Select or Create build.hob");
    fb.init_path(".");
    fb.init_file("build.hob");
    fb.add_filter("Hob Build File", "*.hob");
    
    auto files = fb.show();
    if (!files.empty() && files[0].filename() == "build.hob") {
        return files[0].parent_path().string();
    }
    return "";
}

int main() {
    using namespace nana;

    form fm(API::make_center(400, 200), appear::decorate<appear::taskbar>());
    fm.caption("Hobuild GUI");

    label dir_label(fm, "No directory selected");
    button select_btn(fm, "Select build.hob Location");
    button create_btn(fm, "Create");
    create_btn.enabled(false);

    place pl(fm);
    pl.div("vert <><weight=25 gap=5 dir_label><><weight=30 gap=10 select_btn><><weight=30 gap=10 create_btn><>");
    pl["dir_label"] << dir_label;
    pl["select_btn"] << select_btn;
    pl["create_btn"] << create_btn;
    pl.collocate();

    std::string selected_dir;

    select_btn.events().click([&] {
        if (auto dir = select_build_file(fm); !dir.empty()) {
            selected_dir = dir;
            dir_label.caption("Will create in: " + selected_dir);
            create_btn.enabled(true);
        }
    });

    create_btn.events().click([&] {
        if (selected_dir.empty()) return;
        
        std::ofstream out(selected_dir + "/build.hob");
        if (out) {
            out << "p INT = \"...\"\n\n";
            out << "all;\n";
            out << "    !(INT) ...";
            msgbox info(fm, "Success");
            info << "build.hob created in:\n" << selected_dir;
            info.show();
        } else {
            msgbox err(fm, "Error");
            err << "Failed to create file in:\n" << selected_dir;
            err.show();
        }
    });

    fm.show();
    exec();
}
