const CAPACITY_AMIN: [&str; 5] = ["󰁺", "󰁼", "󰁾", "󰂀", "󰁹"];
const CHARGINH_AMIN: [&str; 5] = ["󰁺", "󰁼", "󰁾", "󰂀", "󰁹"];
//["󰂆", "󰂇", "󰢝", "󰢞", "󰂅"];

fn main() -> anyhow::Result<()> {
    std::env::set_current_dir("/")?;

    let mut battery_life_str = std::fs::read_to_string("./sys/class/power_supply/BAT0/capacity")?;
    let mut battery_life = battery_life_str.trim().parse::<u8>()?;
    let mut battery = "";

    let mut battery_charging: String;
    let mut charging: &str = "";

    let battery_list: [u8; 5] = [10, 20, 50, 75, 90];

    loop {
        battery_life_str = std::fs::read_to_string("./sys/class/power_supply/BAT0/capacity")?;
        if battery_life_str.trim().parse::<u8>().unwrap() != battery_life {
            battery_life = battery_life_str.trim().parse::<u8>()?
        }
        for i in 0..CAPACITY_AMIN.len() {
            if battery_list[i] <= battery_life {
                battery = CAPACITY_AMIN[i];
            }
        }

        battery_charging = std::fs::read_to_string("./sys/class/power_supply/BAT0/status")?
            .trim()
            .to_string();
        match battery_charging.as_str() {
            "Discharging" => charging = "",
            _ => {
                if battery_life >= 100 {
                    charging = CHARGINH_AMIN[4];
                    println!("󱐋:{charging} {battery_life}%");
                    std::thread::sleep(std::time::Duration::from_secs(2));
                    continue;
                }

                if charging.is_empty() || charging == CHARGINH_AMIN[4] {
                    charging = CHARGINH_AMIN[0];
                    println!("󱐋:{charging} {battery_life}%");
                    std::thread::sleep(std::time::Duration::from_secs(2));
                    continue;
                }

                let mut anim_new = true;
                for i in 0..CHARGINH_AMIN.len().saturating_sub(1) {
                    if charging == CHARGINH_AMIN[i] && anim_new {
                        charging = CHARGINH_AMIN[i + 1];
                        anim_new = false
                    }
                }
                println!("󱐋:{charging} {battery_life}%");
                std::thread::sleep(std::time::Duration::from_secs(2));
                continue;
            }
        }

        println!("{} {}%", battery, battery_life);
        std::thread::sleep(std::time::Duration::from_secs(2));
    }
}
