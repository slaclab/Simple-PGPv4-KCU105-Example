Search.setIndex({"docnames": ["HowTo/clone", "HowTo/fileio", "HowTo/firmware", "HowTo/hardware_debug", "HowTo/index", "HowTo/interactive_mode", "HowTo/remote_debug", "HowTo/remote_program", "HowTo/simulation", "HowTo/software_gui", "HowTo/tag_release", "HowTo/zmq_multi_client", "Setup/hardware_setup", "Setup/index", "Setup/pcie_setup", "Setup/rogue_setup", "Setup/vivado_setup", "index", "introduction"], "filenames": ["HowTo/clone.rst", "HowTo/fileio.rst", "HowTo/firmware.rst", "HowTo/hardware_debug.rst", "HowTo/index.rst", "HowTo/interactive_mode.rst", "HowTo/remote_debug.rst", "HowTo/remote_program.rst", "HowTo/simulation.rst", "HowTo/software_gui.rst", "HowTo/tag_release.rst", "HowTo/zmq_multi_client.rst", "Setup/hardware_setup.rst", "Setup/index.rst", "Setup/pcie_setup.rst", "Setup/rogue_setup.rst", "Setup/vivado_setup.rst", "index.rst", "introduction.rst"], "titles": ["How to Clone the GIT repository", "How to the Rogue FileWriter and FileReader", "How to build the firmware", "How to implement ILA in Vivado with ruckus", "HowTos", "How to run the Software in Interactive Mode", "How to use Xilinx Virtual Cable (XVC) with ILA", "How to reprogram your KCU105 board\u2019s QSPI Boot Prom", "How to run the Software Development GUI with VCS firmware simulator", "How to run the Software Development GUI with KCU105 Hardware", "How to ruckus\u2019s Tag Release Script", "How to run multiple GUI clients on the same KCU105 server", "Hardware Setup", "Setup", "PCIe Card Setup", "Rogue Software Setup", "Vivado and VCS Setup", "Welcome to Simple-PGPv4-KCU105-Example\u2019s documentation!", "Introduction"], "terms": {"recurs": [0, 14], "http": [0, 1, 3, 5, 6, 7, 10, 12, 14, 15, 16, 18], "github": [0, 1, 3, 5, 7, 10, 14, 15], "com": [0, 1, 3, 5, 6, 7, 10, 12, 14, 16, 18], "slaclab": [0, 1, 3, 5, 7, 10, 14, 15], "simpl": [0, 2, 3, 5, 8, 9, 10, 11, 15, 16], "pgpv4": [0, 2, 3, 5, 8, 9, 10, 11, 15, 16, 18], "kcu105": [0, 1, 2, 3, 4, 5, 6, 8, 10, 12, 15, 16], "exampl": [0, 2, 3, 5, 7, 8, 9, 10, 11, 12, 14, 15, 16, 18], "includ": [1, 3, 10, 16, 18], "gener": [1, 3, 6], "purpos": 1, "file": [1, 3, 6, 7, 10], "write": [1, 3, 7], "reader": 1, "quickli": 1, "data": [1, 6, 7, 18], "disk": 1, "analysi": 1, "offlin": 1, "start": [1, 5, 6, 7, 8], "up": [1, 8, 12], "pydm": [1, 11], "gui": [1, 2, 4, 6, 17], "refer": [1, 2, 5, 6, 7, 8, 9, 10, 11, 18], "run": [1, 4, 6, 7, 17], "softwar": [1, 4, 6, 7, 10, 11, 13, 17], "develop": [1, 4, 11, 12, 17, 18], "hardwar": [1, 4, 6, 7, 11, 13, 14, 17], "go": [1, 2, 6, 8, 10, 14], "system": 1, "tab": [1, 6], "A": [1, 6, 10, 18], "click": [1, 6], "auto": 1, "name": [1, 3, 6], "b": 1, "open": [1, 6], "c": 1, "debug": [1, 3, 6], "tree": 1, "nagiv": 1, "root": [1, 5, 7], "app": [1, 14], "apptx": [1, 18], "execut": [1, 8], "0x100": 1, "sendfram": 1, "close": 1, "python": [1, 5, 6, 7, 8, 9, 11], "script": [1, 3, 4, 5, 6, 7, 8, 9, 11, 17], "py": [1, 5, 6, 7, 8, 9, 11], "datafil": 1, "data_20220614_114953": 1, "dat": 1, "pyrogu": [1, 5, 7, 11], "version": [1, 5, 7], "v5": [1, 5, 7], "14": 1, "0": [1, 5, 7, 14], "zmqserver": [1, 5, 7], "port": [1, 3, 5, 6, 7], "9099": [1, 5, 11], "9101": [1, 5], "To": [1, 6, 7], "m": [1, 11], "server": [1, 4, 6, 17], "localhost": [1, 6, 11], "us": [1, 3, 4, 7, 8, 10, 11, 14, 17, 18], "virtual": [1, 4, 11, 17], "client": [1, 4, 17], "interfac": [1, 6, 18], "virtualcli": 1, "addr": 1, "eventfram": 1, "header": 1, "1": [1, 5, 6, 7, 11, 12, 15], "2": [1, 5, 6, 7], "253": 1, "254": 1, "255": 1, "As": [1, 5], "you": [1, 3, 5, 6, 10, 11, 12, 14, 17], "can": [1, 6, 10, 11, 18], "see": [1, 17], "256": [1, 14], "ar": [1, 6, 17, 18], "print": 1, "out": [1, 3, 5, 17], "per": 1, "frame": 1, "setup": [2, 5, 6, 7, 8, 9, 10, 11, 17], "xilinx": [2, 4, 10, 12, 16, 17], "licens": [2, 5, 10, 16], "vivado": [2, 4, 5, 6, 7, 8, 10, 13, 17], "vc": [2, 4, 6, 10, 13, 17], "target": [2, 3, 6, 7, 8, 10], "directori": [2, 3, 7, 8, 10, 14], "via": [2, 3, 6, 10, 12], "make": [2, 7, 8, 10, 14], "cd": [2, 5, 8, 9, 10, 11, 14, 15], "simplepgp4kcu105exampl": [2, 3, 5, 7, 8, 10], "option": [2, 10], "review": 2, "result": [2, 6], "mode": [2, 4, 6, 17], "add": [3, 6], "pre_opt_run": 3, "tcl": [3, 6], "your": [3, 4, 6, 17], "": [3, 4, 5, 6, 11, 12, 14, 15, 16, 18], "here": [3, 8, 10, 12, 14, 15, 16], "an": [3, 5, 12, 18], "blob": [3, 10], "main": [3, 6, 10, 18], "firmwar": [3, 4, 5, 6, 7, 10, 13, 16, 17, 18], "basic": [3, 11], "format": 3, "helper": 3, "function": 3, "get": [3, 5], "variabl": 3, "procedur": [3, 13], "sourc": [3, 8, 15, 16], "quiet": 3, "env": 3, "ruckus_dir": 3, "vivado_env_var": 3, "vivado_proc": 3, "return": 3, "want": 3, "bypass": 3, "thi": [3, 4, 10, 11, 13, 14, 16, 17, 18], "chipscop": [3, 6], "cmd": [3, 7], "els": 3, "comment": 3, "defin": [3, 6, 10], "ilanam": 3, "creat": [3, 6], "core": [3, 5, 7, 18], "set": [3, 6], "u_ila_0": 3, "createdebugcor": 3, "record": 3, "depth": 3, "other": 3, "properti": [3, 6], "set_properti": 3, "c_data_depth": 3, "1024": 3, "get_debug_cor": 3, "clock": [3, 6], "netnam": 3, "setdebugcoreclk": 3, "clock_netnam": 3, "probe": [3, 6], "configprob": 3, "probe_netnam": 3, "map": [3, 6], "writedebugprob": 3, "automat": 3, "copi": [3, 18], "ltx": [3, 6], "imag": [3, 7, 10], "end": 3, "build": [3, 4, 7, 8, 10, 14, 15, 17], "exist": 3, "section": [4, 13], "describ": [4, 13], "how": [4, 14, 15, 16, 17, 18], "clone": [4, 14, 15, 16, 17], "git": [4, 10, 14, 15, 16, 17], "repositori": [4, 10, 15, 16, 17], "reprogram": [4, 17], "board": [4, 12, 14, 17, 18], "qspi": [4, 12, 17], "boot": [4, 12, 17], "prom": [4, 12, 17], "interact": [4, 6, 17], "multipl": [4, 17], "same": [4, 6, 10, 17], "simul": [4, 17], "implement": [4, 6, 17], "ila": [4, 17], "rucku": [4, 6, 17], "cabl": [4, 12, 17], "xvc": [4, 17], "rogu": [4, 5, 6, 7, 8, 9, 11, 13, 17], "filewrit": [4, 17], "fileread": [4, 17], "tag": [4, 17], "releas": [4, 14, 17], "i": [5, 6, 7, 10, 15, 17, 18], "argument": [5, 8, 11], "ipython": 5, "3": 5, "7": 5, "10": 5, "packag": [5, 18], "conda": [5, 15], "forg": 5, "default": 5, "feb": 5, "19": 5, "2021": [5, 7], "16": [5, 7, 14, 15], "07": 5, "37": 5, "type": [5, 7], "copyright": 5, "credit": 5, "more": [5, 6, 10, 11, 18], "inform": [5, 6, 10, 18], "23": 5, "enhanc": 5, "help": [5, 10], "8": [5, 7], "axivers": [5, 7], "count": [5, 7], "reset": [5, 6, 7], "call": [5, 7], "path": [5, 7, 15, 18], "fwversion": [5, 7], "0x1010000": 5, "uptim": [5, 7], "dai": 5, "22": 5, "45": 5, "50": [5, 7], "githash": [5, 7], "0xa75a5f55b0ea87cb5b66f1ea1bff12272ae1bc73": 5, "xilinxdnaid": [5, 7], "0x4002000100fa6901008125c1": 5, "fwtarget": [5, 7], "buildenv": [5, 7], "v2021": [5, 7], "buildserv": [5, 7], "rdsrv303": 5, "ubuntu": [5, 7], "20": [5, 7], "04": [5, 7, 14], "lt": [5, 7], "builddat": [5, 7], "mon": 5, "jul": [5, 7], "08": 5, "42": 5, "18": 5, "am": 5, "pdt": [5, 7], "builder": [5, 7], "ruckman": [5, 7, 17], "scratchpad": 5, "3735928559": 5, "getdisp": 5, "0xdeadbeef": 5, "In": [5, 6], "now": [5, 6], "have": [5, 7, 10, 14, 15, 16, 17], "command": 5, "termin": [5, 11], "let": [5, 6], "chang": 5, "from": [5, 6, 7, 11, 18], "0x12345678": 5, "setdisp": 5, "The": [6, 7, 10, 11, 18], "remot": 6, "access": [6, 18], "k": 6, "pgp": [6, 14, 18], "instead": 6, "jtag": [6, 7], "view": 6, "link": 6, "regist": [6, 7, 18], "stream": [6, 14, 18], "howev": 6, "doe": [6, 11], "NOT": [6, 11], "support": [6, 11, 16, 18], "non": 6, "oper": 6, "program": [6, 7], "ibert": 6, "mig": 6, "calibr": 6, "For": [6, 10, 11, 12], "about": [6, 17, 18], "homepag": 6, "www": [6, 12, 16], "product": [6, 12], "intellectu": 6, "html": [6, 12, 15, 16], "note": 6, "need": [6, 11, 12, 14, 15, 16], "use_xvc_debug": 6, "makefil": 6, "bridg": 6, "export": 6, "common": 6, "rtl": 6, "vhd": 6, "surf": [6, 11], "udpdebugbridgewrapp": 6, "channel": 6, "u_vc2_rx": 6, "entiti": 6, "pgprxvcfifo": 6, "tpd_g": 6, "rogue_sim_en_g": 6, "simulation_g": 6, "phy_axi_config_g": 6, "pgp4_axis_config_c": 6, "app_axi_config_g": 6, "emac_axis_config_c": 6, "pgpclk": 6, "domain": 6, "pgprst": 6, "rxlinkreadi": 6, "pgprxout": 6, "linkreadi": 6, "pgprxmaster": 6, "pgprxctrl": 6, "pgprxslave": 6, "axi": [6, 14, 18], "axisclk": 6, "axilclock": 6, "axisrst": 6, "axilreset": 6, "axismast": 6, "ibxvcmast": 6, "axisslav": 6, "ibxvcslav": 6, "u_xvc": 6, "clk": 6, "rst": 6, "udp": 6, "observermast": 6, "observerslav": 6, "ibservermast": 6, "obxvcmast": 6, "ibserverslav": 6, "obxvcslav": 6, "u_vc2_tx": 6, "pgptxvcfifo": 6, "txlinkreadi": 6, "pgptxout": 6, "pgptxmaster": 6, "pgptxslave": 6, "simple_pgp4_kcu105_exampl": 6, "_root": 6, "self": 6, "protocol": [6, 18], "2542": 6, "addprotocol": 6, "connect": [6, 11, 18], "dmastream": 6, "first": [6, 7, 11], "either": [6, 8], "next": 6, "screen": 6, "manag": [6, 11], "new": [6, 7, 17], "select": 6, "enter": [6, 7], "host": 6, "If": [6, 7, 11], "local": [6, 15], "ran": 6, "differ": 6, "comput": [6, 14], "ip": 6, "address": 6, "pc": 6, "hostnam": 6, "network": 6, "finish": 6, "window": 6, "after": [6, 15, 16], "debug_bridge_0": 6, "navig": 6, "post_synthesi": 6, "onc": [6, 8], "load": [6, 7, 14], "ethernet": 6, "must": 7, "time": [7, 11, 17], "bit": 7, "fpga": 7, "sure": 7, "sw15": [7, 12], "mc": 7, "updatebootprom": 7, "path_to_image_dir": 7, "output": [7, 8], "9107": 7, "9109": 7, "old": 7, "0x1000000": 7, "32": 7, "03": 7, "dirti": 7, "uncommit": 7, "code": 7, "0x4002000100f1cd4544618485": 7, "rdsrv307": 7, "thu": 7, "15": 7, "01": 7, "44": 7, "36": 7, "pm": 7, "0x01000000": 7, "20210715134436": 7, "20210716121151": 7, "50550dd": 7, "pcie": [7, 13, 17], "card": [7, 13, 17], "aximicronn25q": 7, "loadmcsfil": 7, "50550dd_primari": 7, "gz": 7, "manufactur": 7, "id": 7, "0x20": 7, "0xbb": 7, "capac": 7, "0x19": 7, "statu": 7, "0x2": 7, "volatil": 7, "config": 7, "reg": 7, "0xfb": 7, "read": 7, "100": 7, "eras": 7, "verifi": 7, "took": 7, "00": [7, 14], "ha": [7, 18], "been": 7, "written": 7, "iprog": 7, "power": 7, "cycl": 7, "requir": [7, 13], "50550dd_secondari": 7, "49": 7, "reload": 7, "done": 7, "0x50550dd2881fed3f48af0ca0db8a78da9f3e2363": 7, "fri": 7, "12": 7, "11": 7, "51": 7, "two": [8, 18], "follow": 8, "instruct": 8, "docker": 8, "contain": 8, "simplepgp4kcu105example_project": 8, "sim": 8, "sim_1": 8, "behav": 8, "vhpi": 8, "environ": [8, 15], "setup_env": 8, "sh": [8, 15, 16], "compil": 8, "sim_vcs_mx": 8, "launch": 8, "dve": 8, "verdi": 8, "simv": 8, "verdi_opt": 8, "sx": 8, "when": 8, "pop": 8, "dev": [8, 14], "devgui": [8, 9, 11], "provid": 10, "user": 10, "onli": [10, 11], "combin": 10, "attach": 10, "do": [10, 15], "commit": 10, "binari": 10, "enabl": 10, "abl": 10, "hash": 10, "both": 10, "pleas": [10, 17], "present": [10, 18], "below": [10, 18], "doc": 10, "googl": 10, "d": [10, 15], "1d6rwhgmm1hem3o1ao5ykfpz1smlpqvzcc5gok5vnc84": 10, "edit": 10, "usp": 10, "share": 10, "yaml": 10, "locat": 10, "all": 10, "configur": 10, "where": 10, "project": 10, "without": 10, "release_fil": 10, "rudp": 11, "physic": 11, "than": 11, "zeromq": 11, "mean": 11, "becaus": 11, "directli": 11, "asynchron": 11, "o": 11, "guityp": 11, "none": 11, "1st": 11, "second": 11, "2nd": 11, "zmqclientgui": 11, "one": [12, 14], "kit": 12, "10gbe": 12, "sfp": 12, "transceiv": 12, "fiber": 12, "optic": 12, "f": 12, "74668": 12, "also": [12, 16], "well": [12, 16], "40180": 12, "switch": 12, "posit": 12, "arrow": 12, "direct": 12, "pgp4_10gbp": 14, "platform": 14, "repo": 14, "ae": 14, "driver": 14, "data_dev": 14, "dma": 14, "confirm": 14, "vid": 14, "1a4a": 14, "slac": [14, 17, 18], "pid": 14, "2030": 14, "daq": 14, "lspci": 14, "nn": 14, "grep": 14, "signal": 14, "process": 14, "control": 14, "1180": 14, "nation": 14, "acceler": 14, "lab": 14, "tid": 14, "air": 14, "sudo": 14, "sbin": 14, "insmod": 14, "datadev": 14, "ko": 14, "cfgsize": 14, "0x50000": 14, "cfgrxcount": 14, "cfgtxcount": 14, "give": 14, "appropri": 14, "group": 14, "permiss": 14, "chmod": 14, "666": 14, "check": 14, "devic": 14, "cat": 14, "proc": 14, "datadev_0": 14, "setup_env_slac": [15, 16], "instal": [15, 16], "With": 15, "anaconda": 15, "io": 15, "enviro": 15, "my": 15, "anaconda3": 15, "etc": 15, "profil": 15, "activ": 15, "rogue_v5": 15, "tool": 16, "download": 16, "licensing_solution_cent": 16, "current": 17, "work": 17, "progress": 17, "being": 17, "ad": 17, "increment": 17, "over": 17, "introduct": 17, "howto": 17, "email": 17, "stanford": [17, 18], "edu": [17, 18], "ani": 17, "error": 17, "question": 17, "anyth": 17, "we": 17, "still": 17, "flush": 17, "typo": 17, "index": 17, "modul": [17, 18], "search": 17, "page": 17, "structur": 18, "divid": 18, "block": 18, "applic": 18, "between": 18, "lite": 18, "buse": 18, "bu": 18, "arm": 18, "document": 18, "ihi0022": 18, "e": 18, "transfer": 18, "async": 18, "messag": 18, "ihi0051": 18, "axi4": 18, "insid": 18, "produc": 18, "steam": 18, "rout": 18, "confluenc": 18, "x": 18, "1dzgeq": 18, "diagram": 18, "shown": 18, "design": 18, "templat": 18, "thei": 18, "custom": 18, "specif": 18, "treat": 18, "bsp": 18}, "objects": {}, "objtypes": {}, "objnames": {}, "titleterms": {"how": [0, 1, 2, 3, 5, 6, 7, 8, 9, 10, 11], "clone": 0, "git": 0, "repositori": 0, "rogu": [1, 15], "filewrit": 1, "fileread": 1, "build": 2, "firmwar": [2, 8], "implement": 3, "ila": [3, 6], "vivado": [3, 16], "rucku": [3, 10], "howto": 4, "run": [5, 8, 9, 11], "softwar": [5, 8, 9, 15], "interact": 5, "mode": 5, "us": 6, "xilinx": 6, "virtual": 6, "cabl": 6, "xvc": 6, "reprogram": 7, "your": 7, "kcu105": [7, 9, 11, 17], "board": 7, "": [7, 10, 17], "qspi": 7, "boot": 7, "prom": 7, "develop": [8, 9], "gui": [8, 9, 11], "vc": [8, 16], "simul": 8, "In": 8, "first": 8, "termin": 8, "second": 8, "hardwar": [9, 12], "tag": 10, "releas": 10, "script": 10, "creat": 10, "multipl": 11, "client": 11, "same": 11, "server": 11, "start": 11, "zmq": 11, "launch": 11, "two": 11, "differ": 11, "get": 11, "access": 11, "anoth": 11, "i": 11, "alreadi": 11, "setup": [12, 13, 14, 15, 16], "pcie": 14, "card": 14, "If": [15, 16], "you": [15, 16], "ar": [15, 16], "slac": [15, 16], "af": [15, 16], "network": [15, 16], "NOT": [15, 16], "welcom": 17, "simpl": 17, "pgpv4": 17, "exampl": 17, "document": 17, "content": 17, "indic": 17, "tabl": 17, "introduct": 18}, "envversion": {"sphinx.domains.c": 3, "sphinx.domains.changeset": 1, "sphinx.domains.citation": 1, "sphinx.domains.cpp": 9, "sphinx.domains.index": 1, "sphinx.domains.javascript": 3, "sphinx.domains.math": 2, "sphinx.domains.python": 4, "sphinx.domains.rst": 2, "sphinx.domains.std": 2, "sphinx.ext.intersphinx": 1, "sphinx.ext.todo": 2, "sphinx.ext.viewcode": 1, "sphinx": 58}, "alltitles": {"How to Clone the GIT repository": [[0, "how-to-clone-the-git-repository"]], "How to the Rogue FileWriter and FileReader": [[1, "how-to-the-rogue-filewriter-and-filereader"]], "How to build the firmware": [[2, "how-to-build-the-firmware"]], "How to implement ILA in Vivado with ruckus": [[3, "how-to-implement-ila-in-vivado-with-ruckus"]], "HowTos": [[4, "howtos"]], "HowTos:": [[4, null]], "How to run the Software in Interactive Mode": [[5, "how-to-run-the-software-in-interactive-mode"]], "How to use Xilinx Virtual Cable (XVC) with ILA": [[6, "how-to-use-xilinx-virtual-cable-xvc-with-ila"]], "How to reprogram your KCU105 board\u2019s QSPI Boot Prom": [[7, "how-to-reprogram-your-kcu105-board-s-qspi-boot-prom"]], "How to run the Software Development GUI with VCS firmware simulator": [[8, "how-to-run-the-software-development-gui-with-vcs-firmware-simulator"]], "In the first terminal": [[8, "in-the-first-terminal"]], "In the Second terminal": [[8, "in-the-second-terminal"]], "How to run the Software Development GUI with KCU105 Hardware": [[9, "how-to-run-the-software-development-gui-with-kcu105-hardware"]], "How to ruckus\u2019s Tag Release Script": [[10, "how-to-ruckus-s-tag-release-script"]], "How to create a tag release": [[10, "how-to-create-a-tag-release"]], "How to run multiple GUI clients on the same KCU105 server": [[11, "how-to-run-multiple-gui-clients-on-the-same-kcu105-server"]], "How to start the ZMQ server then launch two different ZMQ clients": [[11, "how-to-start-the-zmq-server-then-launch-two-different-zmq-clients"]], "How to get access with another client if ZMQ server is already running": [[11, "how-to-get-access-with-another-client-if-zmq-server-is-already-running"]], "Hardware Setup": [[12, "hardware-setup"]], "Setup": [[13, "setup"]], "Setup:": [[13, null]], "PCIe Card Setup": [[14, "pcie-card-setup"]], "Rogue Software Setup": [[15, "rogue-software-setup"]], "If you are on the SLAC AFS network": [[15, "if-you-are-on-the-slac-afs-network"], [16, "if-you-are-on-the-slac-afs-network"]], "If you are NOT on the SLAC AFS network": [[15, "if-you-are-not-on-the-slac-afs-network"], [16, "if-you-are-not-on-the-slac-afs-network"]], "Vivado and VCS Setup": [[16, "vivado-and-vcs-setup"]], "Welcome to Simple-PGPv4-KCU105-Example\u2019s documentation!": [[17, "welcome-to-simple-pgpv4-kcu105-example-s-documentation"]], "Contents:": [[17, null]], "Indices and tables": [[17, "indices-and-tables"]], "Introduction": [[18, "introduction"]]}, "indexentries": {}})