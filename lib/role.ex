alias Converge.{All, Util}

defmodule RoleQemuHost do
	require Util
	import Util, only: [conf_file: 1, conf_dir: 1]

	def role(_tags \\ []) do
		%{
			desired_packages: [
				"virt-manager",          # for managing qemu-based VMs and starting them at boot
				"libvirt-daemon-system", # for managing qemu-based VMs and starting them at boot
				"qemu-system-x86",       # for running qemu VMs
				"ovmf",                  # for UEFI-based qemu VMs
			],
			post_install_unit: %All{units: [
				conf_dir("/etc/libvirt"),
				conf_file("/etc/libvirt/qemu.conf"),
			]}
		}
	end
end
