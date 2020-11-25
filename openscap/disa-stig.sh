#!/bin/sh
# https://github.com/OpenSCAP/openscap/blob/maint-1.3/docs/manual/manual.adoc#44-how-to-evaluate-disa-stig
# docker exec -it openscap bash

cd /home
wget https://dl.dod.cyber.mil/wp-content/uploads/stigs/zip/U_RHEL_7_V3R1_STIG_SCAP_1-2_Benchmark.zip
unzip U_RHEL_7_V3R1_STIG_SCAP_1-2_Benchmark.zip
oscap info U_RHEL_7_V3R1_STIG_SCAP_1-2_Benchmark.xml
oscap xccdf eval --profile xccdf_mil.disa.stig_profile_MAC-1_Classified --results results.xml U_RHEL_7_V3R1_STIG_SCAP_1-2_Benchmark.xml
oscap xccdf generate report --output report.html results.xml