=head1 LICENSE

Copyright [1999-2014] Wellcome Trust Sanger Institute and the EMBL-European Bioinformatics Institute

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

=cut

## EG Plants hack - Display warning only for Barley 
package EnsEMBL::Web::Component::Location::Summary;

use strict;
use previous qw(content);

sub content {
  my $self = shift;
  
  my $html = $self->PREV::content(@_);
    
  if ($html and $self->hub->species =~ /^(Hordeum_vulgare|Triticum_aestivum)$/) {
    $html .= $self->_warning('Non-standard assembly', '<p>This assembly comprises sets of contigs co-located by linkage with markers on physical and/or genetic maps. Internally, each set (or "bin") is arbitrarily ordered.  The scope of each bin is indicated in a track in the panel below. <a href="/' . $self->hub->species . '/Info/Annotation/#assembly">More information</a></p>');
  }

  return $html;
}
## 

1;
