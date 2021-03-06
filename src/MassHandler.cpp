/*******************************************************************************
 Copyright 2006-2012 Lukas Käll <lukas.kall@scilifelab.se>

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.

 *******************************************************************************/
#include <assert.h>
#include <cmath>
#include "MassHandler.h"

MassHandler::MassHandler() {
}

MassHandler::~MassHandler() {
}

bool MassHandler::monoisotopic = false;

double MassHandler::massDiff(double observedMass, double calculatedMass, unsigned int charge) {
  assert(charge > 0);
  double dm = observedMass - calculatedMass;
  if (monoisotopic) {
    double isodm = dm - 1;
    for (int isotope = 0; isotope < 5; ++isotope) {
      if (abs(isodm) > abs(dm + isotope)) {
        isodm = dm + isotope;
      }
    }
    dm = isodm / calculatedMass;
    return dm;
  }
  return dm / charge;
}
