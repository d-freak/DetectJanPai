package dFreak.detectJanPai;

import wiz.project.jan.JanPai;

/**
 * Created by masaue on 2017/07/12.
 */

enum DetectedJanPai {
    MAN_1,
    MAN_1_REVERSE,
    PIN_1,
    SOU_1,
    SOU_1_REVERSE,
    MAN_2,
    MAN_2_REVERSE,
    PIN_2,
    SOU_2,
    MAN_3,

    MAN_3_REVERSE,
    PIN_3,
    SOU_3,
    SOU_3_REVERSE,
    MAN_4,
    MAN_4_REVERSE,
    PIN_4,
    SOU_4,
    MAN_5,
    MAN_5_REVERSE,

    PIN_5,
    SOU_5,
    MAN_6,
    MAN_6_REVERSE,
    PIN_6,
    PIN_6_REVERSE,
    SOU_6,
    MAN_7,
    MAN_7_REVERSE,
    PIN_7,

    PIN_7_REVERSE,
    SOU_7,
    SOU_7_REVERSE,
    MAN_8,
    MAN_8_REVERSE,
    PIN_8,
    SOU_8,
    MAN_9,
    MAN_9_REVERSE,
    PIN_9,

    SOU_9,
    CHUN,
    CHUN_REVERSE,
    HAKU,
    HATU,
    HATU_REVERSE,
    NAN,
    NAN_REVERSE,
    PEI,
    PEI_REVERSE,

    SHA,
    SHA_REVERSE,
    TON,
    TON_REVERSE;



    public static DetectedJanPai getDetectedJanPai(final int id) {
        DetectedJanPai[] detectedJanPais = DetectedJanPai.values();
        for (DetectedJanPai detectedJanPai : detectedJanPais) {
            if (detectedJanPai.ordinal() == id) {
                return detectedJanPai;
            }
        }
        return null;
    }

    public boolean isReverse() {
        switch (this) {
            case MAN_1_REVERSE:
            case SOU_1_REVERSE:
            case MAN_2_REVERSE:
            case MAN_3_REVERSE:
            case SOU_3_REVERSE:
            case MAN_4_REVERSE:
            case MAN_5_REVERSE:
            case MAN_6_REVERSE:
            case PIN_6_REVERSE:
            case MAN_7_REVERSE:
            case PIN_7_REVERSE:
            case SOU_7_REVERSE:
            case MAN_8_REVERSE:
            case MAN_9_REVERSE:
            case CHUN_REVERSE:
            case HATU_REVERSE:
            case NAN_REVERSE:
            case PEI_REVERSE:
            case SHA_REVERSE:
            case TON_REVERSE:
                return true;
        }
        return false;
    }

    public JanPai toJanPai() {
        switch (this) {
            case MAN_1:
                return JanPai.MAN_1;
            case MAN_1_REVERSE:
                return JanPai.MAN_1;
            case PIN_1:
                return JanPai.PIN_1;
            case SOU_1:
                return JanPai.SOU_1;
            case SOU_1_REVERSE:
                return JanPai.SOU_1;
            case MAN_2:
                return JanPai.MAN_2;
            case MAN_2_REVERSE:
                return JanPai.MAN_2;
            case PIN_2:
                return JanPai.PIN_2;
            case SOU_2:
                return JanPai.SOU_2;
            case MAN_3:
                return JanPai.MAN_3;
            case MAN_3_REVERSE:
                return JanPai.MAN_3;
            case PIN_3:
                return JanPai.PIN_3;
            case SOU_3:
                return JanPai.SOU_3;
            case SOU_3_REVERSE:
                return JanPai.SOU_3;
            case MAN_4:
                return JanPai.MAN_4;
            case MAN_4_REVERSE:
                return JanPai.MAN_4;
            case PIN_4:
                return JanPai.PIN_4;
            case SOU_4:
                return JanPai.SOU_4;
            case MAN_5:
                return JanPai.MAN_5;
            case MAN_5_REVERSE:
                return JanPai.MAN_5;
            case PIN_5:
                return JanPai.PIN_5;
            case SOU_5:
                return JanPai.SOU_5;
            case MAN_6:
                return JanPai.MAN_6;
            case MAN_6_REVERSE:
                return JanPai.MAN_6;
            case PIN_6:
                return JanPai.PIN_6;
            case PIN_6_REVERSE:
                return JanPai.PIN_6;
            case SOU_6:
                return JanPai.SOU_6;
            case MAN_7:
                return JanPai.MAN_7;
            case MAN_7_REVERSE:
                return JanPai.MAN_7;
            case PIN_7:
                return JanPai.PIN_7;
            case PIN_7_REVERSE:
                return JanPai.PIN_7;
            case SOU_7:
                return JanPai.SOU_7;
            case SOU_7_REVERSE:
                return JanPai.SOU_7;
            case MAN_8:
                return JanPai.MAN_8;
            case MAN_8_REVERSE:
                return JanPai.MAN_8;
            case PIN_8:
                return JanPai.PIN_8;
            case SOU_8:
                return JanPai.SOU_8;
            case MAN_9:
                return JanPai.MAN_9;
            case MAN_9_REVERSE:
                return JanPai.MAN_9;
            case PIN_9:
                return JanPai.PIN_9;
            case SOU_9:
                return JanPai.SOU_9;
            case CHUN:
                return JanPai.CHUN;
            case CHUN_REVERSE:
                return JanPai.CHUN;
            case HAKU:
                return JanPai.HAKU;
            case HATU:
                return JanPai.HATU;
            case HATU_REVERSE:
                return JanPai.HATU;
            case NAN:
                return JanPai.NAN;
            case NAN_REVERSE:
                return JanPai.NAN;
            case PEI:
                return JanPai.PEI;
            case PEI_REVERSE:
                return JanPai.PEI;
            case SHA:
                return JanPai.SHA;
            case SHA_REVERSE:
                return JanPai.SHA;
            case TON:
                return JanPai.TON;
            case TON_REVERSE:
                return JanPai.TON;
        }
        return JanPai.HAKU;
    }
}
