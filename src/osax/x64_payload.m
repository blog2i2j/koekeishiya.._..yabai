#define asm__call_add_space(v0,v1,func) \
    __asm__("movq %0, %%rdi;""movq %1, %%r13;""callq *%2;" : :"r"(v0), "r"(v1), "r"(func) :"%rdi", "%r13");

#define asm__call_move_space(v0,v1,v2,v3,func) \
    __asm__("movq %0, %%rdi;""movq %1, %%rsi;""movq %2, %%rdx;""movq %3, %%r13;""callq *%4;" : :"r"(v0), "r"(v1), "r"(v2), "r"(v3), "r"(func) :"%rdi", "%rsi", "%rdx", "%r13");

uint64_t get_dock_spaces_offset(NSOperatingSystemVersion os_version) {
    if (os_version.majorVersion == 15) {
        return 0xA0000;
    } else if (os_version.majorVersion == 14) {
        return os_version.minorVersion > 0 ? 0xD5000 : 0x140000;
    } else if (os_version.majorVersion == 13) {
        return 0x140000;
    } else if (os_version.majorVersion == 12) {
        return 0x9000;
    } else if ((os_version.majorVersion == 11) || (os_version.majorVersion == 10 && os_version.minorVersion == 16)) {
        return 0x8d00;
    }

    return 0;
}

uint64_t get_dppm_offset(NSOperatingSystemVersion os_version) {
    if (os_version.majorVersion == 15) {
        return 0x13b000;
    } else if (os_version.majorVersion == 14) {
        return os_version.minorVersion > 0 ? 0x12ce00 : 0x8000;
    } else if (os_version.majorVersion == 13) {
        return 0x8000;
    } else if (os_version.majorVersion == 12) {
        return 0x7000;
    } else if ((os_version.majorVersion == 11) || (os_version.majorVersion == 10 && os_version.minorVersion == 16)) {
        return 0x7000;
    }

    return 0;
}

uint64_t get_fix_animation_offset(NSOperatingSystemVersion os_version) {
    if (os_version.majorVersion == 15) {
        return os_version.minorVersion >= 4 ? 0x270000 : 0x280000;
    } else if (os_version.majorVersion == 14) {
        return os_version.minorVersion > 0 ? 0x1f0000 : 0x210000;
    } else if (os_version.majorVersion == 13) {
        return 0x210000;
    } else if (os_version.majorVersion == 12) {
        return 0x230000;
    } else if ((os_version.majorVersion == 11) || (os_version.majorVersion == 10 && os_version.minorVersion == 16)) {
        return 0x232000;
    }

    return 0;
}

uint64_t get_add_space_offset(NSOperatingSystemVersion os_version) {
    if (os_version.majorVersion == 15) {
        return os_version.minorVersion >= 4 ? 0x270000 : 0x280000;
    } else if (os_version.majorVersion == 14) {
        return os_version.minorVersion > 0 ? 0x1f0000 : 0x217000;
    } else if (os_version.majorVersion == 13) {
        return 0x213000;
    } else if (os_version.majorVersion == 12) {
        return 0x230000;
    } else if ((os_version.majorVersion == 11) || (os_version.majorVersion == 10 && os_version.minorVersion == 16)) {
        return 0x230000;
    }

    return 0;
}

uint64_t get_remove_space_offset(NSOperatingSystemVersion os_version) {
    if (os_version.majorVersion == 15) {
        return 0x1e0000;
    } else if (os_version.majorVersion == 14) {
        return os_version.minorVersion > 0 ? 0x2B0000 : 0x2D0000;
    } else if (os_version.majorVersion == 13) {
        return 0x2C0000;
    } else if (os_version.majorVersion == 12) {
        return 0x2E0000;
    } else if ((os_version.majorVersion == 11) || (os_version.majorVersion == 10 && os_version.minorVersion == 16)) {
        return 0x2E0000;
    }

    return 0;
}

uint64_t get_move_space_offset(NSOperatingSystemVersion os_version) {
    if (os_version.majorVersion == 15) {
        return 0x1e0000;
    } else if (os_version.majorVersion == 14) {
        return os_version.minorVersion > 0 ? 0x2A0000 : 0x2C0000;
    } else if (os_version.majorVersion == 13) {
        return 0x2B0000;
    } else if (os_version.majorVersion == 12) {
        return 0x2D0000;
    } else if ((os_version.majorVersion == 11) || (os_version.majorVersion == 10 && os_version.minorVersion == 16)) {
        return 0x2D0000;
    }

    return 0;
}

uint64_t get_set_front_window_offset(NSOperatingSystemVersion os_version) {
    if (os_version.majorVersion == 15) {
        return 0x3d000;
    } else if (os_version.majorVersion == 14) {
        return os_version.minorVersion > 0 ? 0x4a000 : 0x51BBE;
    } else if (os_version.majorVersion == 13) {
        return 0x52000;
    } else if (os_version.majorVersion == 12) {
        return 0x51000;
    } else if ((os_version.majorVersion == 11) || (os_version.majorVersion == 10 && os_version.minorVersion == 16)) {
        return 0x51000;
    }

    return 0;
}

const char *get_dock_spaces_pattern(NSOperatingSystemVersion os_version) {
    if (os_version.majorVersion == 15) {
        return "?? ?? ?? 00 48 8B 38 48 8B 35 ?? ?? ?? 00 89 DA 41 FF D5 48 89 C7 E8 ?? ?? ?? 00 49 89 C7 48 8B 35 ?? ?? ?? 00 48 89";
    } else if (os_version.majorVersion == 14) {
        if (os_version.minorVersion > 0) {
            return "?? ?? ?? 00 48 8B 38 48 8B 35 ?? ?? ?? 00 89 DA 41 FF D5 48 89 C7 E8 ?? ?? ?? 00 49 89 C7 48 8B 35 ?? ?? ?? 00 48 89";
        }
        return "?? ?? ?? 00 49 8B 3E 48 8B 35 A0 DD 2B 00 44 89 A5 78 FE FF FF 44 89 E2 49 89 DC FF D3 48 89 C7 E8 C5 66 1E 00 48 89 85 F8 FD FF FF 48 8B 3D FB 19 2C 00 E8 0A 66 1E 00 48 8B 1D 2F EA 2B 00 48 89 C7 48 89 DE 31 D2 41 FF D4 48 89 85 38 FE FF FF 49";
    } else if (os_version.majorVersion == 13) {
        return "?? ?? ?? 00 49 8B 7D 00 48 8B 35 ?? ?? ?? 00 44 89 BD ?? FE FF FF 44 89 FA 41 FF D4 48 89 C7 E8 ?? ?? ?? 00 48 89 85 E8 FD FF FF 48 8B 3D ?? ?? ?? 00 E8 ?? ?? ?? 00 48 8B 35 ?? ?? ?? 00 48 89 C7 31 D2 41 FF D4 48 89 85 ?? FE FF FF 49 8B 7D 00 48";
    } else if (os_version.majorVersion == 12) {
        return "?? ?? ?? 00 49 8B ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? 89 ?? 31 D2 41 FF ?? 48 89 85 ?? FE FF FF 49 8B ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? FF ?? ?? 89";
    } else if ((os_version.majorVersion == 11) || (os_version.majorVersion == 10 && os_version.minorVersion == 16)) {
        return "?? ?? ?? 00 49 8B 7D 00 48 8B 35 ?? ?? ?? 00 44 89 BD 38 FE FF FF 44 89 FA 41 FF D4 48 89 C7 E8 ?? ?? ?? 00 48 89 85 E8 FD FF FF 48 8B 3D ?? ?? ?? 00 E8 ?? ?? ?? 00 48 8B 35 ?? ?? ?? 00 48 89 C7 31 D2 41 FF D4 48 89 85 28 FE FF FF 49 8B 7D 00 48";
    }

    return NULL;
}

const char *get_dppm_pattern(NSOperatingSystemVersion os_version) {
    if (os_version.majorVersion == 15) {
        return "?? ?? ?? 00 31 FF 5D E9 ?? ??";
    } else if (os_version.majorVersion == 14) {
        if (os_version.minorVersion > 0) {
            return "?? ?? ?? 00 31 FF 5D E9 ?? ?? 1C 00";
        }
        return "?? ?? ?? 00 4C 89 FE E8 ?? ?? ?? 00 4D 85 FF 0F 84 ?? 06 00 00 48 8D 35 ?? ?? 42 00 31 FF E8 ?? ?? 31 00 48 8B 3D ?? ?? 3F 00 48 8B 35 ?? ?? 3F 00 FF 15 ?? ?? 39 00 48 89 C7 E8 ?? ?? 31 00 48 89 85 10 FF FF FF C7 85 1C FF FF FF 00 00 00 00 E8 ?? ?? 31 00 48 8D 75 B0 89 C7 E8";
    } else if (os_version.majorVersion == 13) {
        return "?? ?? ?? 00 48 89 C6 E8 ?? ?? ?? 00 4D 85 FF 0F 84 ?? 06 00 00 48 8D 35 ?? ?? 41 00 31 FF E8 ?? ?? 30 00 48 8B 3D ?? ?? 3E 00 48 8B 35 ?? ?? 3E 00 FF 15 ?? ?? 37 00 48 89 C7 E8 ?? ?? 30 00 48 89 85 08 FF FF FF C7 85 1C FF FF FF 00 00 00 00 E8 ?? ?? 30 00 48 8D 75 B0 89 C7 E8";
    } else if (os_version.majorVersion == 12) {
        return "?? ?? ?? 00 48 89 C6 E8 ?? ?? 31 00 4D 85 FF 0F 84 ?? 06 00 00 48 8B 3D ?? ?? 40 00 48 8B 35 ?? ?? 3F 00 FF 15 ?? ?? 38 00 48 89 C7 E8 ?? ?? 31 00 48 89 85 08 FF FF FF C7 85 1C FF FF FF 00 00 00 00 E8 ?? ?? 31 00 48 8D 75 B0 89 C7 E8 ?? ?? 31 00 85 C0 75 22 48 8D 35 ?? ?? 35 00 48 8D";
    } else if ((os_version.majorVersion == 11) || (os_version.majorVersion == 10 && os_version.minorVersion == 16)) {
        return "?? ?? ?? 00 48 89 C6 E8 ?? ?? ?? 00 4D 85 ?? 0F 84 ?? 06 00 00 48 8B 3D ?? ?? ?? 00 48 8B 35 ?? ?? ?? 00 FF 15 ?? ?? ?? 00 48 89 C7 E8 ?? ?? ?? 00 48 89 85 08 FF FF FF C7 85 1C FF FF FF 00 00 00 00 E8 ?? ?? ?? 00 48 8D 75 B0 89 C7 E8 ?? ?? ?? ??";
    }

    return NULL;
}


const char *get_fix_animation_pattern(NSOperatingSystemVersion os_version) {
    if (os_version.majorVersion == 15) {
        if (os_version.minorVersion >= 4) {
            return "F2 0F 10 05 DB 13 0B 00 4C 89 F7 48 89 DE";
        }
        return "F2 0F 10 05 ?? ?? ?? 00 48 8B ?? ?? 48 ?? ??";
    } else if (os_version.majorVersion == 14) {
        return "F2 0F 10 05 ?? ?? ?? 00 4C 89 ?? 48 89 DE";
    } else if (os_version.majorVersion == 13) {
        return "F2 0F 10 05 ?? ?? ?? 00 4C 89 ?? 48 8B 75 ?? ?? 89 ?? 44 8B 85 ?? FF FF FF 4C 8B 8D ?? FF FF FF 4C 8B 6D ?? 50 56 6A 01 ?? ?? ?? ?? ?? ??";
    } else if (os_version.majorVersion == 12) {
        return "F2 0F 10 05 ?? ?? ?? 00 4C 89 ?? 48 8B 75 ?? ?? 89 ?? 44 8B 85 ?? FF FF FF 4C 8B 8D ?? FF FF FF 4C 8B 6D ?? 50 56 6A 01 ?? ?? ?? ?? ?? ??";
    } else if ((os_version.majorVersion == 11) || (os_version.majorVersion == 10 && os_version.minorVersion == 16)) {
        return "F2 0F 10 05 ?? ?? 0F 00 4C 89 EF 48 8B 75 B8 4C 89 F2 44 8B 45 A8 4C 8B 8D 28 FF FF FF 4C 8B 6D 98 50 56 6A 01 49 89 DF 53 41 54 E8 ?? ?? 08 00 48 83 C4 30 48 89 45 98";
    }

    return NULL;
}

const char *get_add_space_pattern(NSOperatingSystemVersion os_version) {
    if (os_version.majorVersion == 15) {
        if (os_version.minorVersion >= 4) {
            return "55 48 89 E5 41 57 41 56 41 55 41 54 53 48 83 EC 28 4D 89 EE 48 89 7D B8";
        }
        return "55 48 89 E5 41 57 41 56 41 55 41 54 53 48 83 EC 28 48 BA 01 00 00 00 00";
    } else if (os_version.majorVersion == 14) {
        if (os_version.minorVersion >= 4) {
            return "55 48 89 E5 41 57 41 56 41 55 41 54 53 48 83 EC 28 48 89 7D C8 49 BE 01 00 00 00 00 00 00 40 49 BC F8 FF FF FF FF FF FF 00 49 8D 45 28 48 89 45 D0 4D 8B 7D 28 4C 89 6D B8 41 80 7D 38 01 75 15 4D 85 F7 0F 85 4D 03 00 00 4D 21 E7 49 8B 5F 10 E9 96 01 00 00 4D 85 F7 0F 85 68 03 00 00 4C 89 F8 4C 21 E0 48 8B 58 10 4C 89 FF E8 ?? ?? 10 00 48 85 DB 0F 84 24 01 00 00 49 89 DC 49 FF CC 0F 80 67 03 00 00 49 BE 03 00 00 00 00 00";
        }
        return "55 48 89 E5 41 57 41 56 41 55 41 54 53 48 83 EC 28 48 89 7D C0 48 B8 01 00 00 00 00 00 00 40 48 BB F8 FF FF FF FF FF FF 00 4D 8B 65 28 41 80 7D 38 01 75 1A 49 85 C4 0F 85 7F 03 00 00 49 21 DC 49 8B 4C 24 10 48 89 4D D0 E9 9A 01 00 00 49 85 C4 4C 89 6D C8 0F 85 9C 03 00 00 4C 89 E0 48 21 D8 48 8B 58 10 4C 89 E7 E8 ?? ?? 10 00 48 85 DB 0F 84 10 01 00 00 49 89 DF 49 FF CF 0F 80 9E 03 00 00 49 BE 03 00 00 00 00 00 00 C0 31";
    } else if (os_version.majorVersion == 13) {
        return "55 48 89 E5 41 57 41 56 41 55 41 54 53 48 83 EC 18 48 89 7D D0 48 B8 01 00 00 00 00 00 00 40 49 BF F8 FF FF FF FF FF FF 00 4D 8B 65 28 4C 89 6D C8 41 80 7D 38 01 75 16 49 85 C4 0F 85 ?? 03 00 00 4D 21 FC 4D 8B 74 24 10 E9 ?? 01 00 00 49 85 C4 0F 85 ?? 03 00 00 4C 89 E0 4C 21 F8 4C 8B 70 10 4C 89 E7 E8 ?? ?? ?? 00 4D 85 F6 0F 84 ?? 01 00 00 4D 89 F7 49 FF CF 0F 80 ?? 03 00 00 48 BB 03 00 00 00 00 00 00 C0 31";
    } else if (os_version.majorVersion == 12) {
        return "55 48 89 E5 41 57 41 56 41 55 41 54 53 48 83 EC 18 48 89 7D D0 48 B8 01 00 00 00 00 00 00 40 49 BF F8 FF FF FF FF FF FF 00 4D 8B 65 28 4C 89 6D C8 41 80 7D 38 01 75 16 49 85 C4 0F 85 ?? 03 00 00 4D 21 FC 4D 8B 74 24 10 E9 ?? 01 00 00 49 85 C4 0F 85 ?? 03 00 00 4C 89 E0 4C 21 F8 4C 8B 70 10 4C 89 E7 E8 ?? ?? 0E 00 4D 85 F6 0F 84 ?? 01 00 00 4D 89 F7 49 FF CF 0F 80 ?? 03 00 00 48 BB 03 00 00 00 00 00 00 C0 31";
    } else if ((os_version.majorVersion == 11) || (os_version.majorVersion == 10 && os_version.minorVersion == 16)) {
        if (os_version.majorVersion == 11 && os_version.minorVersion >= 2) {
            return "55 48 89 E5 41 57 41 56 41 55 41 54 53 48 83 EC ?? 48 BA 01 00 00 00 00 00 00 40 48 B9 F8 FF FF FF FF FF FF 00 49 8D 45 28 48 89 45 C8 4D 8B 7D 28 41 80 7D 38 01 48 89 7D D0 4C 89 6D ?? 75 2E 49 89 FC 49 85 D7 74 ?? 4C 89 FB 48 21 CB 41 F6 C7 01 49 0F 45 DF 4C 89 FF E8 ?? ?? ?? 00 48 89 DF E8 ??";
        }
        return "55 48 89 E5 41 57 41 56 41 55 41 54 53 48 83 EC 18 4C 89 6D C0 48 BA 01 00 00 00 00 00 00 40 48 B9 F8 FF FF FF FF FF FF 00 49 8D 45 28 48 89 45 D0 4D 8B 7D 28 41 80 7D 38 01 48 89 7D C8 75 2E 49 89 FC 49 85 D7 74 59 4C 89 FB 48 21 CB 41 F6 C7 01 49 0F 45 DF 4C 89 FF E8 ?? ?? 0F 00 48 89 DF E8 ??";
    }

    return NULL;
}

const char *get_remove_space_pattern(NSOperatingSystemVersion os_version) {
    if (os_version.majorVersion == 15) {
        return "55 48 89 E5 41 57 41 56 41 55 41 54 53 48 83 EC ?? 49 89 ?? 49 89 D6 49 89 F5 ?? 89 ??";
    } else if (os_version.majorVersion == 14) {
        return "55 48 89 E5 41 57 41 56 41 55 41 54 53 48 83 EC 68 48 89 4D ?? 49 89 D7 49 89 F5 49 89 FC 48 BB F8 FF FF FF FF FF FF 00 E8 ?? ?? ?? FF 49 89 C6 48 B8 01 00 00 00 00 00 00 40 4C 21 F3 49 85 C6 0F 85 ?? 02 00 00 48 8B 43 10 48 83 F8 02 0F 8C ?? 02 00 00 4C 89 6D ?? 4C 89 75 A0 48 8D 05 ?? ?? ?? 00 48 8B 00 49 8B 1C 04 4D 8B 74 04 08 48 8D 05 ?? ?? ?? 00 48 8B 38 48 8B 35 ?? ?? ??";
    } else if (os_version.majorVersion == 13) {
        return "55 48 89 E5 41 57 41 56 41 55 41 54 53 48 83 EC 68 48 89 4D 88 49 89 D6 49 89 F5 49 89 FF E8 ?? ?? F4 FF 48 89 C3 48 B8 01 00 00 00 00 00 00 40 48 85 C3 0F 85 ?? 04 00 00 48 B8 F8 FF FF FF FF FF FF 00 48 21 D8 48 8B 40 10 48 83 F8 02 0F 8C ?? 02 00 00 4C 89 6D 90 48 89 5D A8 48 8D 05 ?? ?? 13 00 48 8B 00 4C 89 F3 4D 8B 34 07 4D 8B 64 07 08 48 8D 05 ?? ?? ?? 00 48 8B 38 48 8B 35 ?? ?? 12 00 4C 89 7D A0 4C 89";
    } else if (os_version.majorVersion == 12) {
        if (os_version.minorVersion >= 3) {
            return "55 48 89 E5 41 57 41 56 41 55 41 54 53 48 81 EC A8 00 00 00 48 89 4D 90 49 89 D7 49 89 F5 49 89 FE E8 CD 71 F4 FF 48 89 C3 48 B8 01 00 00 00 00 00 00 40 48 BF F8 FF FF FF FF FF FF 00 48 21 DF 48 85 C3 0F 85 14 06 00 00 48 8B 47 10 48 83 F8 02 0F 8C 22 02 00 00 4C 89 AD 60 FF FF FF 48 89 5D A8 48 8D 05 B3 7D 13 00 48 8B 00 4D 8B 2C 06 49 8B 44 06 08 48 89 45 B8 48 8D 05 B4 7C 14 00 48 8B 38 48 8B 35 C2 BB 11 00";
        }
        return "55 48 89 E5 41 57 41 56 41 55 41 54 53 48 81 EC A8 00 00 00 49 89 CC 49 89 D7 49 89 F5 49 89 FE E8 ?? ?? F4 FF 48 89 C3 48 B8 01 00 00 00 00 00 00 40 48 BF F8 FF FF FF FF FF FF 00 48 21 DF 48 85 C3 0F 85 35 06 00 00 48 8B 47 10 48 83 F8 02 0F 8C 29 02 00 00 4C 89 65 90 4C 89 AD 60 FF FF FF 48 89 5D A0 48 8D 05 ?? ?? 13 00 48 8B 00 4D 8B 2C 06 49 8B 44 06 08 48 89 45 B8 48 8D 05 ?? ?? 14 00 48 8B 38 48 8B 35 ??";
    } else if ((os_version.majorVersion == 11) || (os_version.majorVersion == 10 && os_version.minorVersion == 16)) {
        if (os_version.majorVersion == 11 && os_version.minorVersion >= 3) {
            return "55 48 89 E5 41 57 41 56 41 55 41 54 53 48 81 EC C8 00 00 00 49 89 CC 49 89 D7 49 89 F5 49 89 FE E8 ?? ?? F4 FF 48 89 C3 48 B8 01 00 00 00 00 00 00 40 48 BF F8 FF FF FF FF FF FF 00 48 21 DF 48 85 C3 0F 85 0C 06 00 00 48 8B 47 10 48 83 F8 02 0F 8C 36 02 00 00 4C 89 65 A8 4C 89 AD 68 FF FF FF 48 89 5D A0 48 8D 05 ?? ?? 13 00 48 8B 00 4D";
        }
        return "55 48 89 E5 41 57 41 56 41 55 41 54 53 48 83 EC 68 48 89 4D 98 49 89 D4 49 89 F6 49 89 FF 49 89 F5 E8 ?? ?? F3 FF 49 89 C5 48 B8 01 00 00 00 00 00 00 40 49 85 C5 0F 85 DE 03 00 00 48 B8 F8 FF FF FF FF FF FF 00 4C 21 E8 48 8B 58 10 48 83 FB 02 0F 8C CD 01 00 00 4C 89 75 A0 48 8D 05 ?? ?? ?? 00 48 8B 00 4D 8B 34 07 4C 89 E3 4D 8B 64 07";
    }

    return NULL;
}

const char *get_move_space_pattern(NSOperatingSystemVersion os_version) {
    if (os_version.majorVersion == 15) {
        return "55 48 89 E5 41 57 41 56 41 55 41 54 53 48 83 EC 38 4C 89 E9 41 89 D5 49 89 F7 49 89 FC 48 8B 05 ?? ?? 25";
    } else if (os_version.majorVersion == 14) {
        return "55 48 89 E5 41 57 41 56 41 55 41 54 53 48 83 EC 48 4C 89 E9 41 89 D5 49 89 ?? 49 89 FF ?? 8D ?? ?? ?? ?? 00 ?? 8B ?? ?? 8B ?? 07 ?? 89 ?? 48 89 4D A0 48 89 CE E8 ?? ?? 00 00 48 89 55 D0 48 89 45 C8 48 85 C0 74 3F 48 8D 05 ?? ?? ?? 00 80 38 01 75 ?? ?? 8B ?? D0 ?? 89 ?? 49 83 C5 28 4C 8B 7D C8 4C 89 FF E8 ?? ?? ?? FF 48 89 C7 FF 15 ?? ?? 0C 00";
    } else if (os_version.majorVersion == 13) {
        return "55 48 89 E5 41 57 41 56 41 55 41 54 53 48 83 EC 48 4C 89 E9 41 89 D5 49 89 F6 49 89 FF 48 8D 1D ?? ?? 14 00 48 8B 03 4C 8B 24 07 4C 89 E7 48 89 4D A0 48 89 CE E8 ?? ?? 00 00 48 89 55 D0 48 89 45 C8 48 85 C0 74 3F 48 8D 05 ?? ?? 15 00 80 38 01 75 3A 4C 8B 65 D0 4D 89 E5 49 83 C5 28 4C 8B 7D C8 4C 89 FF E8 ?? ?? F5 FF 48 89 C7 FF 15 ?? ?? 0C 00";
    } else if (os_version.majorVersion == 12) {
        if (os_version.minorVersion >= 3) {
            return "55 48 89 E5 41 57 41 56 41 55 41 54 53 48 83 EC 48 41 89 D6 48 89 75 C8 48 89 FB 4C 8D 3D 7F 64 14 00 49 8B 07 48 8B 3C 07 48 8D 35 E3 F7 00 00 45 31 E4 48 89 7D C0 31 D2 4C 89 6D A8 E8 C6 A9 00 00 48 89 55 D0 48 85 C0 0F 84 B6 04 00 00 48 8D 0D B3 5F 15 00 80 39 01 48 89 45 B0 75 33 4C 8B 7D D0 4D 89 FD 49 83 C5 28 48 89 C3 48 89 C7 E8 7C 8F";
        }
        return "55 48 89 E5 41 57 41 56 41 55 41 54 53 48 83 EC 48 4C 89 E9 41 89 D5 49 89 F6 49 89 FF 48 8D 1D ?? ?? 14 00 48 8B 03 4C 8B 24 07 4C 89 E7 48 89 4D A0 48 89 CE E8 47 B8 00 00 48 85 C0 74 45 48 8D 0D ?? ?? 15 00 80 39 01 48 89 55 C8 48 89 45 A8 75 38 49 89 D5 49 83 C5 28 48 89 C3 48 89 C7 49 89 D7 E8 ?? ?? F5 FF 48 89 C7 FF 15 ?? ?? 0B 00 48 89";
    } else if ((os_version.majorVersion == 11) || (os_version.majorVersion == 10 && os_version.minorVersion == 16)) {
        if (os_version.majorVersion == 11 && os_version.minorVersion >= 3) {
            return "55 48 89 E5 41 57 41 56 41 55 41 54 53 48 83 EC 48 4C 89 E9 41 89 D5 49 89 F6 49 89 FF 48 8D 1D ?? ?? ?? 00 48 8B 03 4C 8B 24 07 4C 89 E7 48 89 4D A0 48 89 CE E8 ?? ?? 00 00 48 85 C0 74 ?? 48 8D 0D ?? ?? ?? 00 80 39 01 48 89 55 C8 48 89 45 A8 75 38 49 89 D5 49 83 C5 28 48 89 C3 48 89 C7";
        }
        return "55 48 89 E5 41 57 41 56 41 55 41 54 53 48 83 EC 48 4C 89 E9 41 89 D5 49 89 F6 49 89 FF 48 8D 1D ?? ?? ?? 00 48 8B 03 4C 8B 24 07 4C 89 E7 48 89 4D A0 48 89 CE E8 ?? ?? 00 00 48 85 C0 74 27 48 8D 0D ?? ?? ?? 00 80 39 01 48 89 55 C8 48 89 45 A8 75 1A 48 89 C7 4C 89 F6 49 89 D5 E8 ?? ?? F4";
    }

    return NULL;
}

const char *get_set_front_window_pattern(NSOperatingSystemVersion os_version) {
    if (os_version.majorVersion == 15) {
        return "55 48 89 E5 41 57 41 56 41 54 53 48 83 EC 60 48 8B 05 ?? ?? ?? 00 48 8B 00 48 89 45 D8 85 F6 0F 84 ?? 02 00 00 89 F3 49 89 FE 49 89 FC 49 C1 ?? 20 ?? 8D ?? AF 41 C6 07 00 4C 89 FE E8 ?? ?? 06 00 48 8B";
    } else if (os_version.majorVersion == 14) {
        return "55 48 89 E5 41 57 41 56 41 54 53 48 83 EC 60 48 8B 05 ?? ?? ?? 00 48 8B 00 48 89 45 D8 85 F6 0F 84 ?? 02 00 00 89 F3 49 89 FE 49 89 FF 49 C1 EF 20 48 8D 75 AF C6 06 00 E8 ?? ?? 02 00 48 8B 3D ?? ?? ?? 00 BE 01 00 00 00 E8 ?? ?? ?? 00 84 C0 74 5A 44 0F B6 65 AF 4C 8D 45 B0 41 C7 00 00 04 00 04 45 89 70 04 66 B8 00 04 66 41 89 40 08 45 89 78 0A 66 41 89 40 0E 41 89 58 10 66 41 89 40";
    } else if (os_version.majorVersion == 13) {
        return "55 48 89 E5 41 57 41 56 41 55 41 54 53 48 83 EC 58 48 8B 05 ?? ?? ?? 00 48 8B 00 48 89 45 D0 85 F6 0F 84 00 02 00 00 41 89 F6 49 89 FD 49 89 FF 49 C1 EF 20 48 8D 75 AF C6 06 00 E8 ?? ?? 02 00 48 8B 3D ?? ?? ?? 00 BE 01 00 00 00 E8 ?? ?? 2C 00 84 C0 74 59 0F B6 5D AF 4C 8D 45 B0 41 C7 00 00 04 00 04 45 89 68 04 66 B8 00 04 66 41 89 40 08 45 89 78 0A 66 41 89 40 0E 45 89 70 10 66 41";
    } else if (os_version.majorVersion == 12) {
        return "55 48 89 E5 41 57 41 56 41 55 41 54 53 48 83 EC 58 48 8B 05 ?? ?? ?? 00 48 8B 00 48 89 45 D0 85 F6 0F 84 00 02 00 00 41 89 F6 49 89 FD 49 89 FF 49 C1 EF 20 48 8D 75 AF C6 06 00 E8 ?? ?? 02 00 48 8B 3D ?? ?? ?? 00 BE 01 00 00 00 E8 ?? ?? 2C 00 84 C0 74 59 0F B6 5D AF 4C 8D 45 B0 41 C7 00 00 04 00 04 45 89 68 04 66 B8 00 04 66 41 89 40 08 45 89 78 0A 66 41 89 40 0E 45 89 70 10 66 41";
    } else if ((os_version.majorVersion == 11) || (os_version.majorVersion == 10 && os_version.minorVersion == 16)) {
        return "55 48 89 E5 41 57 41 56 41 55 41 54 53 48 83 EC 58 48 8B 05 ?? ?? ?? 00 48 8B 00 48 89 45 D0 85 F6 0F 84 ?? 02 00 00 41 89 F5 49 89 FF 49 89 FE 49 C1 EE 20 48 8D 75 AF C6 06 00 E8 ?? ?? 02 00 48 8B 3D ?? ?? ?? 00 BE 01 00 00 00 E8 ?? ?? ?? 00 84 C0 74 59 0F B6 5D AF 4C 8D 45";
    }

    return NULL;
}

